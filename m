Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D195E3B6B72
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 01:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhF1Xkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 19:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235694AbhF1Xkc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 19:40:32 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C78C061768
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 16:38:05 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d5so14855060qtd.5
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 16:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xdpnfmj08WLMarmLZ+rrfJ5BJlgSMicFkBXDYXSvGR8=;
        b=PkPoRIqf/0MDO9iOS99WH8r/73VMI9F0KzQqCxVG8/pndAflSSMpcxXWVqspV0NG4F
         EBEAIHXWomhxOls6eYc1cG+LHYFmO4tKGd1YoO5Yi1bEK+56aqIUUK5oizIEB+0fz0rq
         F4fXTCMU4BddwGSuZz1S7KgB4QZ33aFtREIsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xdpnfmj08WLMarmLZ+rrfJ5BJlgSMicFkBXDYXSvGR8=;
        b=Aywm/iZJQWhZnF16hID07WUCeftFasIlkbQ9zBYiNMPMw49QWJ8ilmZ4xCyg7yB7W7
         A1bprcfboK6xjl++IRBOL28b0ucWhU4eXEgD6wU63CgpT4wLnn29tl2wwHkSiskXxkK8
         rp49nUCFqNjZfuaj6dub0M7AH4CRBd9GTlDH8CnMWpsbYYZ1EZ5IeYIxZFERPSAaVHi3
         Du5uLZV+VfssQ3JWmgnKJkl2AwAS8YjvoAY2I0Q1kdrXu6InnDNF62aAtekeCV57Nm3Y
         kyuc4nxWa/268FXYGxARdalWKj/0TK7jgG18Ko7NT9eDabl4Ufheru9I/z062F7puf/o
         I7Uw==
X-Gm-Message-State: AOAM533nKJbCNP9Nfzs6tCv+wNWRFvvA8MdfQNm2XOk4QCAObeTtvaeT
        SfiaNAyLlMn7+FSvLZaLOVWPxj7wiTQT0A==
X-Google-Smtp-Source: ABdhPJynyQfj/7t/YaHKBo4zc4tjycftu4CoiHGjEtdkl88LAmSl8aCMgORj1wlyNr2b2G33/VnaOA==
X-Received: by 2002:ac8:4888:: with SMTP id i8mr15002809qtq.166.1624923484097;
        Mon, 28 Jun 2021 16:38:04 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id s8sm118294qtw.10.2021.06.28.16.38.02
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:38:02 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id p22so8105683yba.7
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 16:38:02 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr34178571ybm.345.1624923481876;
 Mon, 28 Jun 2021 16:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210625052213.32260-1-vkoul@kernel.org> <20210625052213.32260-5-vkoul@kernel.org>
In-Reply-To: <20210625052213.32260-5-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Jun 2021 16:37:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UfZxKyUZMK9c74KmMBBqgYROn1zp+vLfHaj_ghUK1t+g@mail.gmail.com>
Message-ID: <CAD=FV=UfZxKyUZMK9c74KmMBBqgYROn1zp+vLfHaj_ghUK1t+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] spi: spi-geni-qcom: Add support for GPI dma
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 10:22 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> We can use GPI DMA for devices where it is enabled by firmware. Add
> support for this mode
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 329 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 315 insertions(+), 14 deletions(-)

Not a truly full review since I haven't looked into the whole GSI DMA
driver, but I tried to go over most of your changes.


> +#define GSI_LOOPBACK_EN                (BIT(0))
> +#define GSI_CS_TOGGLE          (BIT(3))
> +#define GSI_CPHA               (BIT(4))
> +#define GSI_CPOL               (BIT(5))
> +
> +#define MAX_TX_SG              (3)
> +#define NUM_SPI_XFER           (8)
> +#define SPI_XFER_TIMEOUT_MS    (250)

nit: don't need the extra parenthesis around everything above and it
doesn't match the existing definitions too.


> +struct gsi_desc_cb {
> +       struct spi_geni_master *mas;
> +       struct spi_transfer *xfer;
> +};
> +
> +struct spi_geni_gsi {
> +       dma_cookie_t tx_cookie;
> +       dma_cookie_t rx_cookie;
> +       struct dma_async_tx_descriptor *tx_desc;
> +       struct dma_async_tx_descriptor *rx_desc;
> +       struct gsi_desc_cb tx_cb;
> +       struct gsi_desc_cb rx_cb;
> +};

I'd be curious if others feel the same way, but to me it kinda feels
like this should be:

struct spi_geni_gsi_pipe {
  dma_cookie_t cookie;
  struct dma_async_tx_descriptor *desc;
  struct gsi_desc_cb cb;
};

struct spi_geni_gsi {
  spi_geni_gsi_pipe tx;
  spi_geni_gsi_pipe rx;
};

That would actually make spi_gsi_callback_result() more elegant
because you could pass in the correct structure and then a string "RX"
or "TX" and get rid of the bool.


> @@ -84,6 +110,13 @@ struct spi_geni_master {
>         int irq;
>         bool cs_flag;
>         bool abort_failed;
> +       struct spi_geni_gsi *gsi;

Maybe do something to make it obvious that this points to an array of
NUM_SPI_XFER transfers.

If my math is right then "gsi" is expected to be about 256 bytes big.
I guess you made this a pointer and only allocated it in GSI mode to
save those 256 bytes in non-GSI mode?


> +static void
> +spi_gsi_callback_result(void *cb, const struct dmaengine_result *result, bool tx)
> +{
> +       struct gsi_desc_cb *gsi = cb;
> +
> +       if (result->result != DMA_TRANS_NOERROR) {id'd do
> +               dev_err(gsi->mas->dev, "%s DMA txn failed\n", tx ? "TX" : "RX");
> +               return;
> +       }
> +
> +       if (!result->residue) {
> +               if (tx)
> +                       complete(&gsi->mas->tx_cb);
> +               else
> +                       complete(&gsi->mas->rx_cb);
> +       } else {
> +               dev_err(gsi->mas->dev, "%s DMA txn has pending %d data\n",
> +                       tx ? "TX" : "RX", result->residue);

I guess you just wait for the timeout in this case since you don't complete?


> +static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas,
> +                         struct spi_device *spi_slv, struct spi_master *spi)
> +{
> +       unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
> +       struct spi_geni_gsi *gsi;
> +       struct dma_slave_config config = {};
> +       struct gpi_spi_config peripheral = {};
> +       unsigned long timeout, jiffies;

Is it really a good idea to have a local variable called "jiffies"?
Isn't the global called "jiffies"?


> +       int ret, i;
> +
> +       config.peripheral_config = &peripheral;
> +       config.peripheral_size = sizeof(peripheral);
> +       peripheral.set_config = true;
> +
> +       if (xfer->bits_per_word != mas->cur_bits_per_word ||
> +           xfer->speed_hz != mas->cur_speed_hz) {
> +               mas->cur_bits_per_word = xfer->bits_per_word;
> +               mas->cur_speed_hz = xfer->speed_hz;
> +       }

It seems a bit pointless to copy these things into "mas" for GSI mode
and even more pointless to have the "if" test first.

In FIFO mode I believe we stored them in "mas" because we needed them
from the interrupt handler. It also lets us optimize and avoid calls
if the config didn't change. You don't need them for either of these
reasons, do you?

Actually, you might possibly want to keep "cur_speed_hz" and use it to
avoid a call to get_spi_clk_cfg() which, at least at one point in
time, was a bit slow.


> +       if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
> +               peripheral.rx_len = ((xfer->len << 3) / mas->cur_bits_per_word);
> +       } else {
> +               int bytes_per_word = (mas->cur_bits_per_word / BITS_PER_BYTE) + 1;
> +
> +               peripheral.rx_len = (xfer->len / bytes_per_word);
> +       }

I guess you could only do the above if "rx_buf" and then you don't
have to zero it back out below.


> +       if (xfer->tx_buf && xfer->rx_buf) {
> +               peripheral.cmd = SPI_DUPLEX;
> +       } else if (xfer->tx_buf) {
> +               peripheral.cmd = SPI_TX;
> +               peripheral.rx_len = 0;
> +       } else if (xfer->rx_buf) {
> +               peripheral.cmd = SPI_RX;
> +       }
> +
> +       if (spi_slv->mode & SPI_LOOP)
> +               peripheral.loopback_en = true;
> +       if (spi_slv->mode & SPI_CPOL)
> +               peripheral.clock_pol_high = true;
> +       if (spi_slv->mode & SPI_CPHA)
> +               peripheral.data_pol_high = true;

nit: I'd do it without the "if"s.

peripheral.loopback_en = spi_slv->mode & SPI_LOOP;

In theory much of this could also be done at function init time but I
dunno if it makes a huge difference, like:

struct gpi_spi_config peripheral = {
  .loopback_en = spi_slv->mode & SPI_LOOP,
  .clock_pol_high = spi_slv->mode & SPI_CPOL,
  ...
};


> +       peripheral.cs = spi_slv->chip_select;
> +       peripheral.pack_en = true;
> +       peripheral.word_len = xfer->bits_per_word - MIN_WORD_LEN;
> +       peripheral.fragmentation = FRAGMENTATION;
> +
> +       ret = get_spi_clk_cfg(mas->cur_speed_hz, mas,
> +                             &peripheral.clk_src, &peripheral.clk_div);
> +       if (ret) {
> +               dev_err(mas->dev, "Err in get_spi_clk_cfg() :%d\n", ret);
> +               return ret;
> +       }
> +
> +       gsi = &mas->gsi[mas->num_xfers];

It sure feels like you should error-check this against NUM_SPI_XFER.
Otherwise if someone does a transfer with more than 8 parts you're
totally hosed, right?

Actually, why do you even need an array here? It seems like by the
time this function exits the transfer will be all done, right? So you
can just keep using the same structure over and over again? It can
even be on the stack?


> +       gsi->rx_cb.mas = mas;
> +       gsi->rx_cb.xfer = xfer;
> +
> +       if (peripheral.cmd & SPI_RX) {
> +               dmaengine_slave_config(mas->rx, &config);
> +               gsi->rx_desc = dmaengine_prep_slave_sg(mas->rx, xfer->rx_sg.sgl, xfer->rx_sg.nents,
> +                                                      DMA_DEV_TO_MEM, flags);
> +               if (!gsi->rx_desc) {
> +                       dev_err(mas->dev, "Err setting up rx desc\n");
> +                       return -EIO;
> +               }
> +               gsi->rx_desc->callback_result = spi_gsi_rx_callback_result;
> +               gsi->rx_desc->callback_param = &gsi->rx_cb;
> +       }
> +
> +       dmaengine_slave_config(mas->tx, &config);
> +       gsi->tx_desc = dmaengine_prep_slave_sg(mas->tx, xfer->tx_sg.sgl, xfer->tx_sg.nents,
> +                                              DMA_MEM_TO_DEV, flags);
> +       if (!gsi->tx_desc) {
> +               dev_err(mas->dev, "Err setting up tx desc\n");
> +               return -EIO;
> +       }

I haven't dug deeply, but it surprises me that we do all the TX config
even if "xfer->tx_buf" is NULL.


> +       gsi->tx_cb.mas = mas;
> +       gsi->tx_cb.xfer = xfer;
> +       gsi->tx_desc->callback_result = spi_gsi_tx_callback_result;
> +       gsi->tx_desc->callback_param = &gsi->tx_cb;
> +
> +       if (peripheral.cmd & SPI_RX)
> +               gsi->rx_cookie = dmaengine_submit(gsi->rx_desc);
> +       gsi->tx_cookie = dmaengine_submit(gsi->tx_desc);
> +
> +       if (peripheral.cmd & SPI_RX)
> +               dma_async_issue_pending(mas->rx);
> +       dma_async_issue_pending(mas->tx);
> +       mas->num_xfers++;
> +
> +       jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
> +       timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);

You're waiting a hardcoded 250 ms for every transfer. That could be
too short for a long transfer. Can you use some logic like the SPI
framework?

It's probably also worth adding a comment about why you can't just
return "1" from transfer_one() for GSI mode and let the SPI framework
handle the timeout calculations. My guess is that you might need extra
time because another processor might hold the SPI bus and keep you
from starting your transfer right away and thus your timeout needs to
be somehow longer than the normal SPI framework. Is that true?

Actually, it looks like spi_transfer_wait() already has 200 ms of
slop. Is that enough for you? Can you just let the SPI framework
handle the timeout?


> +       if (timeout <= 0) {

Just "== 0". "timeout" is unsigned, right?


> +               dev_err(mas->dev, "Tx[%d] timeout%lu\n", i, timeout);

timeout is always 0 in this printout.


> +               ret = -ETIMEDOUT;
> +               goto err_gsi_geni_transfer_one;
> +       }
> +
> +       if (peripheral.cmd & SPI_RX) {
> +               jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
> +               timeout = wait_for_completion_timeout(&mas->rx_cb, jiffies);

Why do you need to re-init the timeout? You should just wait for
however much is left from the previous wait? The TX and RX should be
happening in parallel, right? So you don't want to wait for a full
second transfer.


> +               if (timeout <= 0) {
> +                       dev_err(mas->dev, "Rx[%d] timeout%lu\n", i, timeout);
> +                       ret = -ETIMEDOUT;
> +                       goto err_gsi_geni_transfer_one;
> +               }
> +       }
> +
> +       spi_finalize_current_transfer(spi);
> +       return 0;
> +
> +err_gsi_geni_transfer_one:
> +       dmaengine_terminate_all(mas->tx);

I know not what I'm talking about, but the description of
dmaengine_terminate_all says "This function is DEPRECATED". It also
seems like the old "terminate_all" is async? That's bad because you
gave it stack pointers...

You almost certainly want a WARN_ON or something like that if you fail
to terminate the transfer because, presumably, the DMA engine will
keep looking at your config that's stored on the stack (that you're
freeing by ending the function). That's super bad and I'd want a
pretty serious warning in my logs if it might be happening.


> +static bool geni_can_dma(struct spi_controller *ctlr,
> +                        struct spi_device *slv, struct spi_transfer *xfer)
> +{
> +       struct spi_geni_master *mas = spi_master_get_devdata(slv->master);
> +
> +       /* check if dma is supported */
> +       if (mas->cur_xfer_mode == GENI_GPI_DMA)
> +               return true;
> +
> +       return false;
> +}

nit: might as well handle GENI_SE_DMA as well since it's just as easy
to test against GENI_SE_FIFO?

nit: no need for an if.

So just: return mas->cur_xfer_mode != GENI_SE_FIFO;


>  static int spi_geni_prepare_message(struct spi_master *spi,
>                                         struct spi_message *spi_msg)
>  {
> -       int ret;
>         struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +       int ret;
>
> -       if (spi_geni_is_abort_still_pending(mas))
> -               return -EBUSY;
> +       switch (mas->cur_xfer_mode) {
> +       case GENI_SE_FIFO:
> +               if (spi_geni_is_abort_still_pending(mas))
> +                       return -EBUSY;
> +               ret = setup_fifo_params(spi_msg->spi, spi);
> +               if (ret)
> +                       dev_err(mas->dev, "Couldn't select mode %d\n", ret);
> +               return ret;
>
> -       ret = setup_fifo_params(spi_msg->spi, spi);
> -       if (ret)
> -               dev_err(mas->dev, "Couldn't select mode %d\n", ret);
> +       case GENI_GPI_DMA:
> +               mas->num_xfers = 0;
> +               reinit_completion(&mas->tx_cb);
> +               reinit_completion(&mas->rx_cb);
> +               memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));

nit: make a #define for the size and use it here and in allocation?


> +static int spi_geni_grab_gpi_chan(struct spi_geni_master *mas)
> +{
> +       size_t gsi_sz;
> +       int ret;
> +
> +       mas->tx = dma_request_chan(mas->dev, "tx");
> +       if (IS_ERR_OR_NULL(mas->tx)) {

I don't think dma_request_chan() can return NULL.


> +               dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
> +               ret = PTR_ERR(mas->tx);

niftier: ret = dev_err_probe(mas->dev, PTR_ERR(mas->tx), "Failed to
get tx DMA ch\n");

If you don't think that's nifty, at least you should add a "\n" to
your error message.


> +               goto err_tx;
> +       }

Personally I'm a fan of devm_add_action_or_reset() to simplify error
handling like this. Everything becomes easier to handle then.

ret = devm_add_action_or_reset(mas->dev, spi_geni_dma_release_chan, mas->tx);
if (ret)
  return ret;

You've got to make a tiny spi_geni_dma_release_chan() function that
just wraps dma_release_chan() (or cast and violate the C standard) but
then you get rid of all error handling in this function, get rid of
the code you had to add to remove and the code you forgot to add the
the probe() function (see below). :-)


> +       mas->rx = dma_request_chan(mas->dev, "rx");
> +       if (IS_ERR_OR_NULL(mas->rx)) {
> +               dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
> +               ret = PTR_ERR(mas->rx);
> +               goto err_rx;
> +       }
> +
> +       gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
> +       mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
> +       if (IS_ERR_OR_NULL(mas->gsi))
> +               goto err_mem;

This is not correct. kzalloc() never returns errors, just NULL. ...and
you don't set "ret".

Also: since you re-use this over and over and zero it before each
transfer, you could probably avoid the zero-allocation.


> @@ -349,15 +594,15 @@ static int spi_geni_init(struct spi_geni_master *mas)
>  {
>         struct geni_se *se = &mas->se;
>         unsigned int proto, major, minor, ver;
> -       u32 spi_tx_cfg;
> +       u32 spi_tx_cfg, fifo_disable;
> +       int ret = -ENXIO;
>
>         pm_runtime_get_sync(mas->dev);
>
>         proto = geni_se_read_proto(se);
>         if (proto != GENI_SE_SPI) {
>                 dev_err(mas->dev, "Invalid proto %d\n", proto);
> -               pm_runtime_put(mas->dev);
> -               return -ENXIO;
> +               goto out_pm;

nit: In theory this change could be relegated to a tiny cleanup patch
just to make your GPI change smaller to review, but I won't insist.


> @@ -380,15 +625,38 @@ static int spi_geni_init(struct spi_geni_master *mas)
>         else
>                 mas->oversampling = 1;
>
> -       geni_se_select_mode(se, GENI_SE_FIFO);
> +       fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
> +       switch (fifo_disable) {
> +       case 1:
> +               ret = spi_geni_grab_gpi_chan(mas);
> +               if (!ret) { /* success case */
> +                       mas->cur_xfer_mode = GENI_GPI_DMA;
> +                       geni_se_select_mode(se, GENI_GPI_DMA);
> +                       dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
> +                       break;
> +               }
> +               /*
> +                * in case of failure to get dma channel, we can till do the
> +                * FIFO mode, so fallthrough

s/till/still/

> +                */
> +               dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
> +               fallthrough;

I was under the impression that if `FIFO_IF_DISABLE` was set that the
FIFO was, how shall we say it, "disabled". ;-) If you can in fact fall
back to FIFO mode then that bit seems pretty poorly named.


>  static irqreturn_t geni_spi_isr(int irq, void *data)
> @@ -671,6 +942,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>         if (irq < 0)
>                 return irq;
>
> +       ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));

nit: this function already has the line:

struct device *dev = &pdev->dev;

...so you can use "dev". :-)


> +       if (ret) {
> +               ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +               if (ret) {
> +                       dev_err(&pdev->dev, "could not set DMA mask\n");
> +                       return ret;

niftier: return dev_err_probe(dev, ret, "could not set DMA mask\n");


> @@ -710,14 +990,17 @@ static int spi_geni_probe(struct platform_device *pdev)
>         spi->max_speed_hz = 50000000;
>         spi->prepare_message = spi_geni_prepare_message;
>         spi->transfer_one = spi_geni_transfer_one;
> +       spi->can_dma = geni_can_dma;
> +       spi->dma_map_dev = mas->dev->parent;

mas->dev->parent == dev->parent ?


> @@ -738,6 +1021,14 @@ static int spi_geni_probe(struct platform_device *pdev)
>         if (ret)
>                 goto spi_geni_probe_runtime_disable;
>
> +       /*
> +        * check the mode supported and set_cs for fifo mode only
> +        * for dma (gsi) mode, the gsi will set cs based on params passed in
> +        * TRE
> +        */
> +       if (mas->cur_xfer_mode == GENI_SE_FIFO)
> +               spi->set_cs = spi_geni_set_cs;

I'm curious: is there no way to get set_cs() working in GPI mode? In
an off-thread conversation Qualcomm seemed to indicate that it was
possible, but maybe they didn't quite understand what I was asking.

Without an implementation of set_cs() there will be drivers in Linux
that simply aren't compatible because they make the assumption that
they can lock the bus, set the CS, and do several transfers that are
part of some logical "transaction". I believe that both of the SPI
peripherals on boards that I work on, cros-ec and the SPI TPM make
this assumption. I don't even believe that the drivers can be "fixed"
because the requirement is more at the protocol level. The protocol
requires you to do things like:

0. Lock the bus.
1. Set the CS.
2. Transfer a few bytes, reading the response as you go.
3. Once you see the other side respond that it's ready, transfer some
more bytes.
4. Release the CS.
5. Unlock the bus.

You can't do this without a set_cs() implementation because of the
requirement to read the responses of the other side before moving on
to the next phase of the transfer.

As I understand it this is roughly the equivalent of i2c clock
stretching but much more ad-hoc and defined peripherals-by-peripheral.

In any case, I guess you must have examples of peripherals that need
GPI mode and don't need set_cs() so we shouldn't block your way
forward, but I'm just curious if you had more info on this.


>  static int spi_geni_remove(struct platform_device *pdev)
>  {
>         struct spi_master *spi = platform_get_drvdata(pdev);
> @@ -762,6 +1061,8 @@ static int spi_geni_remove(struct platform_device *pdev)
>         /* Unregister _before_ disabling pm_runtime() so we stop transfers */
>         spi_unregister_master(spi);
>
> +       spi_geni_release_dma_chan(mas);
> +

Why isn't there a call to spi_geni_release_dma_chan() in the error
paths for probe?


-Doug
