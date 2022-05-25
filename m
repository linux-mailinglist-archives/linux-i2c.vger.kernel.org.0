Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D0153408D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 17:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbiEYPoW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 11:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiEYPoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 11:44:22 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C712BB1E;
        Wed, 25 May 2022 08:44:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id z7so15682138ybf.7;
        Wed, 25 May 2022 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wW60Ei1LEDr4i3KMNYvUE+Jfx8WzRpVMj4wd8F6Eb8c=;
        b=V7Nwv9fgiJ0bQxYe49i7Mg37xs4qvR0/vZap13GiBj11xBxeREay48xMpiYK7+qsSw
         gr1o+Sz549iJ4UO3yv5lW+EXCpNx3bReR2wmFjDJoHyPXAAZpImvTdy9MKj3AYRB26W9
         VDWaJi0PxjTnYbUbhSgmvEC9qgYP9xSwZOQUuEWmMWtiD4egBW4kSjXETzZOwK/XGdMO
         ZKTlbBGaDihBrT4ZLdvCGTg+f5bQtY8UCd1f5uR4/RtUnnMu8cDAjHNRkk7jr/7yTw16
         +Occ6XWlKdwsxGtpfiLSX6fXJCvB0K6eF/oacyz9TXKJxIT4xdXDzRn3aJ7tmsRUUXCR
         Ov/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wW60Ei1LEDr4i3KMNYvUE+Jfx8WzRpVMj4wd8F6Eb8c=;
        b=ujrhJwGYi9XxDJPWL2h/KeOMv83BNR3UjArIOhUhE9PGNxkcUpJFB17WOgcTkxMELD
         WFnCnxhnHh02nWYB7aBrI5u+0evqdg/kefh2NvY7TXhSXEf1l/yPPzQ+vI+hJ2HRfihH
         p6ANHzb4mg+XB5YsCp54+9KsnWD+Hzyb6MzJ68LDGRf056aMPNtfBnxwYFSmoTv6oZOO
         6GFh0z8opnV5kwyhXE0cxrkuueU+owH2NZG/fxZNwzge5wLjgydLu9Hl9Lb6kw21YgEZ
         OT0P8kZPCm7sxpGbUU74PoGGyo+GEFgRyRN4l1M/bE1g+pZBHw9Fx/4k9FwK0m2std31
         x6+A==
X-Gm-Message-State: AOAM531/kRoj8Q9AXrgeDTZMtYwhJCZiLJcLUS8efoELj/NEM8hWCWMF
        reFNvHmeGBlQqA7D0SYxp+MSPH+40/kazRtkrxgfaRW7q/beIQ==
X-Google-Smtp-Source: ABdhPJwt+NfnKj2VKz+x3FOzOFwAqCKrdsgAFJl5Sq4ANwRciQDuXogfYc1SZ3B3WS7WeNUC5HDUP7kO5cIGzKNpvXA=
X-Received: by 2002:a25:3447:0:b0:655:b2da:cefc with SMTP id
 b68-20020a253447000000b00655b2dacefcmr3048383yba.96.1653493460311; Wed, 25
 May 2022 08:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220525074757.7519-1-michael.zaidman@gmail.com> <20220525074757.7519-4-michael.zaidman@gmail.com>
In-Reply-To: <20220525074757.7519-4-michael.zaidman@gmail.com>
From:   Guillaume Champagne <champagne.guillaume.c@gmail.com>
Date:   Wed, 25 May 2022 11:44:09 -0400
Message-ID: <CAHSN6OfdHfiZRXjnqvnpcbwS0nt0vBuLiwMHcbpsd_AWiJ3i1g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] HID: ft260: support i2c writes larger than HID
 report size
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le mer. 25 mai 2022 =C3=A0 03:48, Michael Zaidman
<michael.zaidman@gmail.com> a =C3=A9crit :
>
> To support longer than one HID report size write, the driver splits a sin=
gle
> i2c message data payload into multiple i2c messages of HID report size.
> However, it does not replicate the offset bytes within the EEPROM chip in
> every consequent HID report because it is not and should not be aware of
> the EEPROM type. It breaks the i2c write message integrity and causes the
> EEPROM device not to acknowledge the second HID report keeping the i2c bu=
s
> busy until the ft260 controller reports failure.
>

I tested this whole patchset and it resolves the issue I raised
https://patchwork.kernel.org/project/linux-input/patch/20220524192422.13967=
-1-champagne.guillaume.c@gmail.com/,
thanks.

> This patch preserves the i2c write message integrity by manipulating the
> i2c flag bits across multiple HID reports to be seen by the EEPROM device
> as a single i2c write transfer.
>
> Before:
>
> $ sudo ./i2cperf -f 2 -o 2 -s 64 -r 0-0xff 13 0x51 -S
> Error: Sending messages failed: Input/output error
>
> [  +3.667741] ft260_i2c_write: rep 0xde addr 0x51 off 0 len 60 d[0] 0x0
> [  +0.007330] ft260_hid_output_report_check_status: wait 6400 usec, len 6=
4
> [  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
> [  +0.000001] ft260_i2c_write: rep 0xd1 addr 0x51 off 60 len 6 d[0] 0x0
> [  +0.002337] ft260_hid_output_report_check_status: wait 1000 usec, len 1=
0
> [  +0.000157] ft260_xfer_status: bus_status 0x2e, clock 100
> [  +0.000241] ft260_i2c_reset: done
> [  +0.000003] ft260 0003:0403:6030.000E: ft260_i2c_write: failed to start=
 transfer, ret -5
>
> After:
>
> $ sudo ./i2cperf -f 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S
>
>   Fill block with increment via i2ctransfer by chunks
>   -------------------------------------------------------------------
>   data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
>   -------------------------------------------------------------------
>   58986           86             256           2           128
>
> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> ---
>  drivers/hid/hid-ft260.c | 45 ++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 44106cadd746..bfda5b191a3a 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -378,41 +378,50 @@ static int ft260_hid_output_report_check_status(str=
uct ft260_device *dev,
>  }
>
>  static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
> -                          int data_len, u8 flag)
> +                          int len, u8 flag)
>  {
> -       int len, ret, idx =3D 0;
> +       int ret, wr_len, idx =3D 0;
> +       bool first =3D true;
>         struct hid_device *hdev =3D dev->hdev;
>         struct ft260_i2c_write_request_report *rep =3D
>                 (struct ft260_i2c_write_request_report *)dev->write_buf;
>
>         do {
> -               if (data_len <=3D FT260_WR_DATA_MAX)
> -                       len =3D data_len;
> -               else
> -                       len =3D FT260_WR_DATA_MAX;
> +               rep->flag =3D 0;
> +               if (first) {
> +                       rep->flag =3D FT260_FLAG_START;

I feel like multi packet transactions must still honor flag sent to
ft20_i2c_write. This adds a START even if ft260_i2c_write is called
with FT260_FLAG_START_REPEATED or FT260_FLAG_NONE.

> +                       first =3D false;
> +               }
> +
> +               if (len <=3D FT260_WR_DATA_MAX) {
> +                       wr_len =3D len;
> +                       if (flag =3D=3D FT260_FLAG_START_STOP)
> +                               rep->flag |=3D FT260_FLAG_STOP;
> +               } else {
> +                       wr_len =3D FT260_WR_DATA_MAX;
> +               }
>
> -               rep->report =3D FT260_I2C_DATA_REPORT_ID(len);
> +               rep->report =3D FT260_I2C_DATA_REPORT_ID(wr_len);
>                 rep->address =3D addr;
> -               rep->length =3D len;
> -               rep->flag =3D flag;
> +               rep->length =3D wr_len;
>
> -               memcpy(rep->data, &data[idx], len);
> +               memcpy(rep->data, &data[idx], wr_len);
>
> -               ft260_dbg("rep %#02x addr %#02x off %d len %d d[0] %#02x\=
n",
> -                         rep->report, addr, idx, len, data[0]);
> +               ft260_dbg("rep %#02x addr %#02x off %d len %d wlen %d fla=
g %#x d[0] %#02x\n",
> +                         rep->report, addr, idx, len, wr_len,
> +                         rep->flag, data[0]);
>
>                 ret =3D ft260_hid_output_report_check_status(dev, (u8 *)r=
ep,
> -                                                          len + 4);
> +                                                          wr_len + 4);
>                 if (ret < 0) {
> -                       hid_err(hdev, "%s: failed to start transfer, ret =
%d\n",
> -                               __func__, ret);
> +                       hid_err(hdev, "%s: failed with %d\n", __func__, r=
et);
>                         return ret;
>                 }
>
> -               data_len -=3D len;
> -               idx +=3D len;
> +               len -=3D wr_len;
> +               idx +=3D wr_len;
>
> -       } while (data_len > 0);
> +       } while (len > 0);
>
>         return 0;
>  }
> --
> 2.25.1
>
