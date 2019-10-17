Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76292DA53C
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 07:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404536AbfJQF6f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 01:58:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38692 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403772AbfJQF6f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Oct 2019 01:58:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id b20so1163479ljj.5
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2019 22:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HRtuv85RUpCy16P4QblPyyCpN6CMLh+xxluBWZ+uAEw=;
        b=Ne2YZfOC9UHlpsGGMLxTY6lV9RiUqe6Q+pN8CjN/aHcLEMRE0igx9I7P27lJx0w1X4
         10QSrb7X6rOzwBvabaczQaa7BM1EZvcm7pqgvPaBOCknUHY4T13TKGRtbaOuANvzb9oC
         LRpPwVO+4zvgwlZl9A9G1wWX9UNXcXFhHMxX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HRtuv85RUpCy16P4QblPyyCpN6CMLh+xxluBWZ+uAEw=;
        b=Rf0EnTVAixn5HR2dG/U0e6uFCP2KSeqojqlIl2t6eojHUukYYnXgKotF18ALK3407Y
         2S98AxwfHeUKTfxWNKV8omKYHMdDwyrmQgDpW2j3weMefB0WSef6Tk5ufgBkviSM8GLu
         EtcxdiQf1/F4OrNSkxLBkbGyJX2TkiuyjULZOV4d2CpB7ttA5zYQTaFAdoBSIj1dxmOn
         oRKfRX86K47/TvJktv7B8J2SPcbQ2mCHF0o5FwmzmB8I6LdR1Lro5hc8wOCIIh7p8pGt
         kneH3BbsnE2O3cJcfSW2vP4yYkWb/Sg4HqCid3RE7YBfzCdrmeBNf1kiO0a4UiXprGsM
         xXBg==
X-Gm-Message-State: APjAAAV6G5Pwp1VV/s/HpPg1dQQ8LrrwMnO21NMT0+E+Dp7JVxu47+G7
        wxM/p2m0NUrelxo5/f9p/Tfb8Achs20fSe53LTsHgg==
X-Google-Smtp-Source: APXvYqxqQJB/msieF8icOQsw5ZhoCqKjMvP4gFy8B/dbtAU3D+W16fv+WjuhUfBbjT7t93PcFuFKtwhVurE6mnB/wgA=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr1127345ljk.247.1571291912077;
 Wed, 16 Oct 2019 22:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <1569825869-30640-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <CAHO=5PFSTomeNm4vAKyPmRZXNPBKGT4ck3mB8uOY395uwuVdNg@mail.gmail.com>
In-Reply-To: <CAHO=5PFSTomeNm4vAKyPmRZXNPBKGT4ck3mB8uOY395uwuVdNg@mail.gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 17 Oct 2019 11:28:20 +0530
Message-ID: <CAHO=5PFYE0fakcD-dcR018ib_f36fPNaUdZjOJseQTxcO5PfgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: iproc: Add i2c repeated start capability
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Michael Cheng <ccheng@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Icarus Chau <icarus.chau@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Please review the patch and let me know if you still have any review comments.

Best regards,
Rayagonda

On Thu, Oct 10, 2019 at 3:02 PM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:
>
> Hi Wolfram,
>
> Did you get a chance to review this patch.
>
> Best regards,
> Rayagonda
>
>
> On Mon, Sep 30, 2019 at 12:19 PM Rayagonda Kokatanur
> <rayagonda.kokatanur@broadcom.com> wrote:
> >
> > From: Lori Hikichi <lori.hikichi@broadcom.com>
> >
> > Enable handling of i2c repeated start. The current code
> > handles a multi msg i2c transfer as separate i2c bus
> > transactions. This change will now handle this case
> > using the i2c repeated start protocol. The number of msgs
> > in a transfer is limited to two, and must be a write
> > followed by a read.
> >
> > Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
> > Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> > Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>
> > ---
> > changes from v1:
> >  - Address following review comments from Wolfarm Sang,
> >    Use i2c_8bit_addr_from_msg() api instead of decoding i2c_msg struct and
> >    remove check against number of i2c message as it will be taken care
> >    by core using quirks flags.
> >
> >  drivers/i2c/busses/i2c-bcm-iproc.c | 63 ++++++++++++++++++++++++++++++--------
> >  1 file changed, 50 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> > index d7fd76b..e478db7 100644
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> > @@ -81,6 +81,7 @@
> >  #define M_CMD_PROTOCOL_MASK          0xf
> >  #define M_CMD_PROTOCOL_BLK_WR        0x7
> >  #define M_CMD_PROTOCOL_BLK_RD        0x8
> > +#define M_CMD_PROTOCOL_PROCESS       0xa
> >  #define M_CMD_PEC_SHIFT              8
> >  #define M_CMD_RD_CNT_SHIFT           0
> >  #define M_CMD_RD_CNT_MASK            0xff
> > @@ -675,13 +676,20 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
> >         return 0;
> >  }
> >
> > -static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
> > -                                        struct i2c_msg *msg)
> > +/*
> > + * If 'process_call' is true, then this is a multi-msg transfer that requires
> > + * a repeated start between the messages.
> > + * More specifically, it must be a write (reg) followed by a read (data).
> > + * The i2c quirks are set to enforce this rule.
> > + */
> > +static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
> > +                                       struct i2c_msg *msgs, bool process_call)
> >  {
> >         int i;
> >         u8 addr;
> >         u32 val, tmp, val_intr_en;
> >         unsigned int tx_bytes;
> > +       struct i2c_msg *msg = &msgs[0];
> >
> >         /* check if bus is busy */
> >         if (!!(iproc_i2c_rd_reg(iproc_i2c,
> > @@ -707,14 +715,29 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
> >                         val = msg->buf[i];
> >
> >                         /* mark the last byte */
> > -                       if (i == msg->len - 1)
> > -                               val |= BIT(M_TX_WR_STATUS_SHIFT);
> > +                       if (!process_call && (i == msg->len - 1))
> > +                               val |= 1 << M_TX_WR_STATUS_SHIFT;
> >
> >                         iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
> >                 }
> >                 iproc_i2c->tx_bytes = tx_bytes;
> >         }
> >
> > +       /* Process the read message if this is process call */
> > +       if (process_call) {
> > +               msg++;
> > +               iproc_i2c->msg = msg;  /* point to second msg */
> > +
> > +               /*
> > +                * The last byte to be sent out should be a slave
> > +                * address with read operation
> > +                */
> > +               addr = i2c_8bit_addr_from_msg(msg);
> > +               /* mark it the last byte out */
> > +               val = addr | (1 << M_TX_WR_STATUS_SHIFT);
> > +               iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
> > +       }
> > +
> >         /* mark as incomplete before starting the transaction */
> >         if (iproc_i2c->irq)
> >                 reinit_completion(&iproc_i2c->done);
> > @@ -733,7 +756,7 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
> >          * underrun interrupt, which will be triggerred when the TX FIFO is
> >          * empty. When that happens we can then pump more data into the FIFO
> >          */
> > -       if (!(msg->flags & I2C_M_RD) &&
> > +       if (!process_call && !(msg->flags & I2C_M_RD) &&
> >             msg->len > iproc_i2c->tx_bytes)
> >                 val_intr_en |= BIT(IE_M_TX_UNDERRUN_SHIFT);
> >
> > @@ -743,6 +766,8 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
> >          */
> >         val = BIT(M_CMD_START_BUSY_SHIFT);
> >         if (msg->flags & I2C_M_RD) {
> > +               u32 protocol;
> > +
> >                 iproc_i2c->rx_bytes = 0;
> >                 if (msg->len > M_RX_FIFO_MAX_THLD_VALUE)
> >                         iproc_i2c->thld_bytes = M_RX_FIFO_THLD_VALUE;
> > @@ -758,7 +783,10 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
> >                 /* enable the RX threshold interrupt */
> >                 val_intr_en |= BIT(IE_M_RX_THLD_SHIFT);
> >
> > -               val |= (M_CMD_PROTOCOL_BLK_RD << M_CMD_PROTOCOL_SHIFT) |
> > +               protocol = process_call ?
> > +                               M_CMD_PROTOCOL_PROCESS : M_CMD_PROTOCOL_BLK_RD;
> > +
> > +               val |= (protocol << M_CMD_PROTOCOL_SHIFT) |
> >                        (msg->len << M_CMD_RD_CNT_SHIFT);
> >         } else {
> >                 val |= (M_CMD_PROTOCOL_BLK_WR << M_CMD_PROTOCOL_SHIFT);
> > @@ -774,17 +802,24 @@ static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
> >                               struct i2c_msg msgs[], int num)
> >  {
> >         struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adapter);
> > -       int ret, i;
> > +       bool process_call = false;
> > +       int ret;
> >
> > -       /* go through all messages */
> > -       for (i = 0; i < num; i++) {
> > -               ret = bcm_iproc_i2c_xfer_single_msg(iproc_i2c, &msgs[i]);
> > -               if (ret) {
> > -                       dev_dbg(iproc_i2c->device, "xfer failed\n");
> > -                       return ret;
> > +       if (num == 2) {
> > +               /* Repeated start, use process call */
> > +               process_call = true;
> > +               if (msgs[1].flags & I2C_M_NOSTART) {
> > +                       dev_err(iproc_i2c->device, "Invalid repeated start\n");
> > +                       return -EOPNOTSUPP;
> >                 }
> >         }
> >
> > +       ret = bcm_iproc_i2c_xfer_internal(iproc_i2c, msgs, process_call);
> > +       if (ret) {
> > +               dev_dbg(iproc_i2c->device, "xfer failed\n");
> > +               return ret;
> > +       }
> > +
> >         return num;
> >  }
> >
> > @@ -806,6 +841,8 @@ static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
> >  };
> >
> >  static struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
> > +       .flags = I2C_AQ_COMB_WRITE_THEN_READ,
> > +       .max_comb_1st_msg_len = M_TX_RX_FIFO_SIZE,
> >         .max_read_len = M_RX_MAX_READ_LEN,
> >  };
> >
> > --
> > 1.9.1
> >
