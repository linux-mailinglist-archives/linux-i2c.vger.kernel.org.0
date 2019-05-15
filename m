Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42181F89E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2019 18:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfEOQ2T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 May 2019 12:28:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44331 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfEOQ2T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 May 2019 12:28:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id n134so280371lfn.11
        for <linux-i2c@vger.kernel.org>; Wed, 15 May 2019 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=faBgXv8RSAfE8vIL0upvZor3HD+OcrNBzquc/lDTuB8=;
        b=MtEB2j39ppcNayEhkBIBtQrGv7EeL5hrny3H8YedUYMgWPX2OI/YIhDoVtVXCAi4bj
         n+GSme9/5kZwQAzRkcB1j6nDx6whyuHwZ3R160qI4ySK8xmqeEkCuquPXkGFv2zZ7eEk
         2dLfnbhfjUFIEFZaUS4YE3CqYIDeOjYZpQJRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=faBgXv8RSAfE8vIL0upvZor3HD+OcrNBzquc/lDTuB8=;
        b=GhUUCJ++3e0Hafby0Hy2MbQ29qSOc2/hgh5f7+vfAjJAP/xOxQFQI+uMms1IFHNKGl
         VHtqMT34gMPRg+30jXJrTTBDtZv4qDcm1Ey1mwv45CkdkuJml1cgyZRHwwlJfBYD+AlH
         OMPqmqiYRQEJMvEsyeQeQ6pjS9vOEmSm2p7me3uQdsKLy8bPNgHMNfYF2CoId0UiGvU2
         LIX/MqkoscNPKJPqEYqCcu4Opj4bTssOzthMp466Ox0Qik4UUnGl12S/cenVPuwrR5hE
         nepD+13L9YNNrVdhcu5Fp6mP3EMX/NwZ8tXI3DmPfnA/bZVYe41YP3i5nCOZjI+iV2t5
         wYiA==
X-Gm-Message-State: APjAAAU5KXAgJx9RWWZ6lfxfhc/K9L+SOcU6VNvJaOj5UZgqir8qFnjo
        q9fi6mJZoheTTflPIcTXsMc3iHx/+5JlqHV3p38GCg==
X-Google-Smtp-Source: APXvYqxm6oYD6Wtv8tsZX1Sm0L1tNUma61yOuHAzfAbtS9YE6pQsO2j8YdnCQNXIfspvtEDr6j3UH4vKDpeIHZMkWeo=
X-Received: by 2002:a19:196:: with SMTP id 144mr22155132lfb.35.1557937696743;
 Wed, 15 May 2019 09:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557375708-14830-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <508d6d50-29a6-dfa7-8e25-b64fa2cbbb8a@broadcom.com>
In-Reply-To: <508d6d50-29a6-dfa7-8e25-b64fa2cbbb8a@broadcom.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Wed, 15 May 2019 21:58:05 +0530
Message-ID: <CAHO=5PGA5qawSQsn1T-sjDnc8W-n61cQRY-yD8+jfJ6KMgMcZA@mail.gmail.com>
Subject: Re: [PATCH 1/1] i2c: iproc: Add multi byte read-write support for
 slave mode
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michael Cheng <ccheng@broadcom.com>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

No change,  it's just duplicate, please ignore first patch and review
second patch.

Best regards
Rayagonda



On Thu, May 9, 2019 at 9:58 PM Ray Jui <ray.jui@broadcom.com> wrote:
>
> Why is the email sent twice? What has changed?
>
> On 5/8/2019 9:21 PM, Rayagonda Kokatanur wrote:
> > Add multiple byte read-write support for slave mode.
> >
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > ---
> >  drivers/i2c/busses/i2c-bcm-iproc.c | 117 +++++++++++++++++--------------------
> >  1 file changed, 53 insertions(+), 64 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> > index a845b8d..2c7f145 100644
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> > @@ -165,12 +165,6 @@ enum i2c_slave_read_status {
> >       I2C_SLAVE_RX_END,
> >  };
> >
> > -enum i2c_slave_xfer_dir {
> > -     I2C_SLAVE_DIR_READ = 0,
> > -     I2C_SLAVE_DIR_WRITE,
> > -     I2C_SLAVE_DIR_NONE,
> > -};
> > -
> >  enum bus_speed_index {
> >       I2C_SPD_100K = 0,
> >       I2C_SPD_400K,
> > @@ -203,7 +197,6 @@ struct bcm_iproc_i2c_dev {
> >       struct i2c_msg *msg;
> >
> >       struct i2c_client *slave;
> > -     enum i2c_slave_xfer_dir xfer_dir;
> >
> >       /* bytes that have been transferred */
> >       unsigned int tx_bytes;
> > @@ -219,7 +212,8 @@ struct bcm_iproc_i2c_dev {
> >               | BIT(IS_M_RX_THLD_SHIFT))
> >
> >  #define ISR_MASK_SLAVE (BIT(IS_S_START_BUSY_SHIFT)\
> > -             | BIT(IS_S_RX_EVENT_SHIFT) | BIT(IS_S_RD_EVENT_SHIFT))
> > +             | BIT(IS_S_RX_EVENT_SHIFT) | BIT(IS_S_RD_EVENT_SHIFT)\
> > +             | BIT(IS_S_TX_UNDERRUN_SHIFT))
> >
> >  static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave);
> >  static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave);
> > @@ -297,15 +291,11 @@ static void bcm_iproc_i2c_slave_init(
> >       /* clear all pending slave interrupts */
> >       iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
> >
> > -     /* Enable interrupt register for any READ event */
> > -     val = BIT(IE_S_RD_EVENT_SHIFT);
> >       /* Enable interrupt register to indicate a valid byte in receive fifo */
> > -     val |= BIT(IE_S_RX_EVENT_SHIFT);
> > +     val = BIT(IE_S_RX_EVENT_SHIFT);
> >       /* Enable interrupt register for the Slave BUSY command */
> >       val |= BIT(IE_S_START_BUSY_SHIFT);
> >       iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> > -
> > -     iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
> >  }
> >
> >  static void bcm_iproc_i2c_check_slave_status(
> > @@ -314,8 +304,11 @@ static void bcm_iproc_i2c_check_slave_status(
> >       u32 val;
> >
> >       val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
> > -     val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
> > +     /* status is valid only when START_BUSY is cleared after it was set */
> > +     if (val & BIT(S_CMD_START_BUSY_SHIFT))
> > +             return;
> >
> > +     val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
> >       if (val == S_CMD_STATUS_TIMEOUT) {
> >               dev_err(iproc_i2c->device, "slave random stretch time timeout\n");
> >
> > @@ -327,70 +320,66 @@ static void bcm_iproc_i2c_check_slave_status(
> >  }
> >
> >  static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
> > -                             u32 status)
> > +                                 u32 status)
> >  {
> > -     u8 value;
> >       u32 val;
> > -     u32 rd_status;
> > -     u32 tmp;
> > +     u8 value, rx_status;
> >
> > -     /* Start of transaction. check address and populate the direction */
> > -     if (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_NONE) {
> > -             tmp = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> > -             rd_status = (tmp >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> > -             /* This condition checks whether the request is a new request */
> > -             if (((rd_status == I2C_SLAVE_RX_START) &&
> > -                     (status & BIT(IS_S_RX_EVENT_SHIFT))) ||
> > -                     ((rd_status == I2C_SLAVE_RX_END) &&
> > -                     (status & BIT(IS_S_RD_EVENT_SHIFT)))) {
> > -
> > -                     /* Last bit is W/R bit.
> > -                      * If 1 then its a read request(by master).
> > -                      */
> > -                     iproc_i2c->xfer_dir = tmp & SLAVE_READ_WRITE_BIT_MASK;
> > -                     if (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_WRITE)
> > -                             i2c_slave_event(iproc_i2c->slave,
> > -                                     I2C_SLAVE_READ_REQUESTED, &value);
> > -                     else
> > -                             i2c_slave_event(iproc_i2c->slave,
> > +     /* Slave RX byte receive */
> > +     if (status & BIT(IS_S_RX_EVENT_SHIFT)) {
> > +             val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> > +             rx_status = (val >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> > +             if (rx_status == I2C_SLAVE_RX_START) {
> > +                     /* Start of SMBUS for Master write */
> > +                     i2c_slave_event(iproc_i2c->slave,
> >                                       I2C_SLAVE_WRITE_REQUESTED, &value);
> > -             }
> > -     }
> >
> > -     /* read request from master */
> > -     if ((status & BIT(IS_S_RD_EVENT_SHIFT)) &&
> > -             (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_WRITE)) {
> > -             i2c_slave_event(iproc_i2c->slave,
> > -                     I2C_SLAVE_READ_PROCESSED, &value);
> > -             iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> > +                     val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> > +                     value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> > +                     i2c_slave_event(iproc_i2c->slave,
> > +                                     I2C_SLAVE_WRITE_RECEIVED, &value);
> > +             } else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
> > +                     /* Start of SMBUS for Master Read */
> > +                     i2c_slave_event(iproc_i2c->slave,
> > +                                     I2C_SLAVE_READ_REQUESTED, &value);
> > +                     iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> >
> > -             val = BIT(S_CMD_START_BUSY_SHIFT);
> > -             iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> > -     }
> > +                     val = BIT(S_CMD_START_BUSY_SHIFT);
> > +                     iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> >
> > -     /* write request from master */
> > -     if ((status & BIT(IS_S_RX_EVENT_SHIFT)) &&
> > -             (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_READ)) {
> > -             val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> > -             /* Its a write request by Master to Slave.
> > -              * We read data present in receive FIFO
> > -              */
> > -             value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> > +                     /*
> > +                      * Enable interrupt for TX FIFO becomes empty and
> > +                      * less than PKT_LENGTH bytes were output on the SMBUS
> > +                      */
> > +                     val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> > +                     val |= BIT(IE_S_TX_UNDERRUN_SHIFT);
> > +                     iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> > +             } else {
> > +                     /* Master write other than start */
> > +                     value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> > +                     i2c_slave_event(iproc_i2c->slave,
> > +                                     I2C_SLAVE_WRITE_RECEIVED, &value);
> > +             }
> > +     } else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
> > +             /* Master read other than start */
> >               i2c_slave_event(iproc_i2c->slave,
> > -                     I2C_SLAVE_WRITE_RECEIVED, &value);
> > -
> > -             /* check the status for the last byte of the transaction */
> > -             rd_status = (val >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> > -             if (rd_status == I2C_SLAVE_RX_END)
> > -                     iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
> > +                             I2C_SLAVE_READ_PROCESSED, &value);
> >
> > -             dev_dbg(iproc_i2c->device, "\nread value = 0x%x\n", value);
> > +             iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> > +             val = BIT(S_CMD_START_BUSY_SHIFT);
> > +             iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> >       }
> >
> >       /* Stop */
> >       if (status & BIT(IS_S_START_BUSY_SHIFT)) {
> >               i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP, &value);
> > -             iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
> > +             /*
> > +              * Enable interrupt for TX FIFO becomes empty and
> > +              * less than PKT_LENGTH bytes were output on the SMBUS
> > +              */
> > +             val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> > +             val &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
> > +             iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> >       }
> >
> >       /* clear interrupt status */
> >
