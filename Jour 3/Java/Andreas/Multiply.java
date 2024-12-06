package d3;

public class Multiply {
    int index;
    int value;
    boolean canBeUsed = true;

    public Multiply(int index, int value) {
        this.index = index;
        this.value = value;
    }

    public boolean isCanBeUsed() {
        return canBeUsed;
    }

    public void setCanBeUsed(boolean canBeUsed) {
        this.canBeUsed = canBeUsed;
    }
}
