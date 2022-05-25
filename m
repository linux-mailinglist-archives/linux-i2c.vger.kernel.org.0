Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3DF534469
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 21:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345571AbiEYTmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345544AbiEYTmw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 15:42:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ADC66F84;
        Wed, 25 May 2022 12:42:47 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t13so12303545wrg.9;
        Wed, 25 May 2022 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RjVXfgFTebr8akrkNryEmTIUcFuS4W+6lxxdsoi42p8=;
        b=kzUTavyjNNP+xvuyM+0euMyZKnVe9UI4FcEcVmm2944HbB0nuAxJs5SDJ6toKECTRX
         JNFY0Bj0Ewy4K7uQOpcxKBIHtkWSnq1ZYs9FWJ8MXSs1zU59ON8SpbXBjrpDzBO8RFj7
         T8sXnzkFRpnvbWEqBGq8MJtTlm6tz8tCXIEeqWE8Q4WmbACy9bNVQ7MMsQluipX9wkB+
         G1sYtbWyrbAyDck7JBB7VEheKxWm2WiYgdLLFwjFNsWBUkjIaL48DYiT8MflpHS35cE2
         hwHjRPXYo4sYM3rYJqbNeYXRZtOY9X94G0P1CfVF1aAWDDA6jKFQ31OYDeB6BRD79QVg
         XJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RjVXfgFTebr8akrkNryEmTIUcFuS4W+6lxxdsoi42p8=;
        b=udhmSHsTMw2rrJKM/y/5uTBD7FwjUd/d0zdhOXvFej6auSSDtzm3s6EvIrEr1lFfhz
         o9ff20M9laGGRaic+4pczY0sOoKBdMgNj6dvTgtmKmRxGsV+DXikpJhFDuysE14hfvFU
         FNxTgWMgEvH9wUHV3NqFzEPuyrYGY/jr6feuoEmKaMT5VnEwLQA1orfH+ecMr4Ufv9Gq
         YSBLEotNeHklkmYQK7/2fJUHHYABBKEJaBK4lcNu4NvhF34cmPmL/dc3Y/Bhl2S0nXz9
         TyMDGjVeFCyCS70A4WaHQjwiIcqqvQZnVue5EqTsk4iWJ/wT/SRIBcBYhyAuUpwkArXO
         wBLw==
X-Gm-Message-State: AOAM530egga8wIZgrcX1enS/YfO9q+O8Iv/TVhe6C7HiLqjIx4Xe+YxB
        Ynn1odg7pwYXqjSxJz/ZLdg=
X-Google-Smtp-Source: ABdhPJylFt48w28iqZRqk7zldwi8zAZbMkcPg0QnupbNZ5/h4/cvtYVRzlnzQhP88NusU/LrwEzK4w==
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id e8-20020a056000178800b0020ca43c10famr28198782wrg.511.1653507765497;
        Wed, 25 May 2022 12:42:45 -0700 (PDT)
Received: from michael-VirtualBox (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.gmail.com with ESMTPSA id v7-20020a056000144700b0020c5253d927sm3041636wrx.115.2022.05.25.12.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 12:42:45 -0700 (PDT)
Date:   Wed, 25 May 2022 22:42:42 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Guillaume Champagne <champagne.guillaume.c@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Subject: Re: [PATCH v1 3/5] HID: ft260: support i2c writes larger than HID
 report size
Message-ID: <20220525194242.GA13454@michael-VirtualBox>
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
 <20220525074757.7519-4-michael.zaidman@gmail.com>
 <CAHSN6OfdHfiZRXjnqvnpcbwS0nt0vBuLiwMHcbpsd_AWiJ3i1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHSN6OfdHfiZRXjnqvnpcbwS0nt0vBuLiwMHcbpsd_AWiJ3i1g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 25, 2022 at 11:44:09AM -0400, Guillaume Champagne wrote:
> Le mer. 25 mai 2022 à 03:48, Michael Zaidman
> <michael.zaidman@gmail.com> a écrit :
> >
> > To support longer than one HID report size write, the driver splits a single
> > i2c message data payload into multiple i2c messages of HID report size.
> > However, it does not replicate the offset bytes within the EEPROM chip in
> > every consequent HID report because it is not and should not be aware of
> > the EEPROM type. It breaks the i2c write message integrity and causes the
> > EEPROM device not to acknowledge the second HID report keeping the i2c bus
> > busy until the ft260 controller reports failure.
> >
> 
> I tested this whole patchset and it resolves the issue I raised
> https://patchwork.kernel.org/project/linux-input/patch/20220524192422.13967-1-champagne.guillaume.c@gmail.com/,
> thanks.

Much appreciated!
I will add your tested-by in the second version of the patchset.

> 
> > This patch preserves the i2c write message integrity by manipulating the
> > i2c flag bits across multiple HID reports to be seen by the EEPROM device
> > as a single i2c write transfer.
> >
> > Before:
> >
> > $ sudo ./i2cperf -f 2 -o 2 -s 64 -r 0-0xff 13 0x51 -S
> > Error: Sending messages failed: Input/output error
> >
> > [  +3.667741] ft260_i2c_write: rep 0xde addr 0x51 off 0 len 60 d[0] 0x0
> > [  +0.007330] ft260_hid_output_report_check_status: wait 6400 usec, len 64
> > [  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
> > [  +0.000001] ft260_i2c_write: rep 0xd1 addr 0x51 off 60 len 6 d[0] 0x0
> > [  +0.002337] ft260_hid_output_report_check_status: wait 1000 usec, len 10
> > [  +0.000157] ft260_xfer_status: bus_status 0x2e, clock 100
> > [  +0.000241] ft260_i2c_reset: done
> > [  +0.000003] ft260 0003:0403:6030.000E: ft260_i2c_write: failed to start transfer, ret -5
> >
> > After:
> >
> > $ sudo ./i2cperf -f 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S
> >
> >   Fill block with increment via i2ctransfer by chunks
> >   -------------------------------------------------------------------
> >   data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
> >   -------------------------------------------------------------------
> >   58986           86             256           2           128
> >
> > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > ---
> >  drivers/hid/hid-ft260.c | 45 ++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > index 44106cadd746..bfda5b191a3a 100644
> > --- a/drivers/hid/hid-ft260.c
> > +++ b/drivers/hid/hid-ft260.c
> > @@ -378,41 +378,50 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
> >  }
> >
> >  static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
> > -                          int data_len, u8 flag)
> > +                          int len, u8 flag)
> >  {
> > -       int len, ret, idx = 0;
> > +       int ret, wr_len, idx = 0;
> > +       bool first = true;
> >         struct hid_device *hdev = dev->hdev;
> >         struct ft260_i2c_write_request_report *rep =
> >                 (struct ft260_i2c_write_request_report *)dev->write_buf;
> >
> >         do {
> > -               if (data_len <= FT260_WR_DATA_MAX)
> > -                       len = data_len;
> > -               else
> > -                       len = FT260_WR_DATA_MAX;
> > +               rep->flag = 0;
> > +               if (first) {
> > +                       rep->flag = FT260_FLAG_START;
> 
> I feel like multi packet transactions must still honor flag sent to
> ft20_i2c_write. This adds a START even if ft260_i2c_write is called
> with FT260_FLAG_START_REPEATED or FT260_FLAG_NONE.

We use the FT260_FLAG_START_REPEATED to precede the Read message following
the Write message in the i2c combined transaction. Am I missing any i2c
protocol case using the Repeated Start in the Write path?

The FT260_FLAG_NONE should not be passed into the ft20_i2c_write as well.

So, we can keep it simple.

