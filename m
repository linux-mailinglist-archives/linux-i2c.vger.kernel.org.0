Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E297AE52A
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 07:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbjIZFln (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 01:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjIZFln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 01:41:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D3AE9;
        Mon, 25 Sep 2023 22:41:36 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so5712865a12.1;
        Mon, 25 Sep 2023 22:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695706895; x=1696311695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq1fspIFsjirF2QJeFwHsMtLnKCKkT6CIKp3dlIQQRw=;
        b=CM/VrL0O6+mtJkvHh/0XUpGkEmeexkPFMmLNBb5QPJSU5NnmZaLft+Ai/TDaAGuJaY
         B1dc1UWDqidgExBzrFtghUbpBWrew6QeiPnWJQSQfVxUuZACwL/RQUbuxYmbl3VqcGNw
         8WsYbaokZY4PPEK9kGQD4OVGRKSnLinWd0VSpUebGkfYFvP8g0anv+8Bg+DuG43DwoCI
         evYnAVmQtme2je32qqA7V6e9Lhh7tk3YVdcHGLyLKLpOTjVcrd0msTy7o5pvN/aOujaD
         kzw/DqZeoOP+YgwgIInquKxh4wmZGflIY2nwbk7mIywACHlxENMhppExRmymAt8byd2/
         sVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695706895; x=1696311695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq1fspIFsjirF2QJeFwHsMtLnKCKkT6CIKp3dlIQQRw=;
        b=h/SiYc7QDyDReQO/PTZwlvr16HSDqjyArCPJHi+nTKgsXm0Nx58sPfU9sZ9sGe+TKu
         3IvlhVZTA2r6H6jPMwJdP4a9yRrnBj7zZlj4e+imyonrW5RmiogcPdz4r9YMV9WJLgo/
         LpBA+Gbn+fCLA6G8wkevn3jritg3MLJtFHFDQZVr6K1PxZiBLI5n+a2aLvYSHJsE0OlC
         EC9dd/ehqjMMJECkR76CwCOhFIsEUlp7hqdqg17NYfeYDhkjgq7EvSwdvgvpP/lQCukD
         +2Q0IdyG9imK0hSmSwspZ2k2Uie87/UZ6/YkokPCGJa1BkwnDDgBJioSe/ePTSK2WToa
         3sEg==
X-Gm-Message-State: AOJu0Yy5EKkry1Q1Yo2lQmtE2DuHrguISZUB6+mtFoJ/6UOdz9imtJYe
        C5ziFb7oPleItw681ZiK5U6t9MAwNy6OcnGF8h8=
X-Google-Smtp-Source: AGHT+IHL8T+K3PDezOhxFtuYl5923Ksx/n2bdRR6YGosxAfr9eRYzXWiXuBJfq+qCm4zZrnMLynd+1j4SxpLrxUbc8E=
X-Received: by 2002:aa7:c502:0:b0:530:9d56:c2a5 with SMTP id
 o2-20020aa7c502000000b005309d56c2a5mr6017562edq.6.1695706894697; Mon, 25 Sep
 2023 22:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230924010214.3700150-1-william@wkennington.com>
In-Reply-To: <20230924010214.3700150-1-william@wkennington.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 26 Sep 2023 08:41:23 +0300
Message-ID: <CAHb3i=uOMuUAz=zY_GFvBi-9JFaaPhN4F0Ve5i1f4WhyjgH8Bw@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: Fix callback completion ordering
To:     "William A. Kennington III" <william@wkennington.com>
Cc:     tmaimon77@gmail.com, avifishman70@gmail.com, wsa@kernel.org,
        joel@jms.id.au, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 24, 2023 at 4:02=E2=80=AFAM William A. Kennington III
<william@wkennington.com> wrote:
>
> Sometimes, our completions race with new master transfers and override
> the bus->operation and bus->master_or_slave variables. This causes
> transactions to timeout and kernel crashes less frequently.
>
> To remedy this, we re-order all completions to the very end of the
> function.
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 495a8b5f6a2b..ae4bae63ad4f 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -694,6 +694,7 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
>  {
>         struct i2c_msg *msgs;
>         int msgs_num;
> +       bool do_complete =3D false;
>
>         msgs =3D bus->msgs;
>         msgs_num =3D bus->msgs_num;
> @@ -722,23 +723,17 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
>                                  msgs[1].flags & I2C_M_RD)
>                                 msgs[1].len =3D info;
>                 }
> -               if (completion_done(&bus->cmd_complete) =3D=3D false)
> -                       complete(&bus->cmd_complete);
> -       break;
> -
> +               do_complete =3D true;
> +               break;
>         case I2C_NACK_IND:
>                 /* MASTER transmit got a NACK before tx all bytes */
>                 bus->cmd_err =3D -ENXIO;
> -               if (bus->master_or_slave =3D=3D I2C_MASTER)
> -                       complete(&bus->cmd_complete);
> -
> +               do_complete =3D true;
>                 break;
>         case I2C_BUS_ERR_IND:
>                 /* Bus error */
>                 bus->cmd_err =3D -EAGAIN;
> -               if (bus->master_or_slave =3D=3D I2C_MASTER)
> -                       complete(&bus->cmd_complete);
> -
> +               do_complete =3D true;
>                 break;
>         case I2C_WAKE_UP_IND:
>                 /* I2C wake up */
> @@ -752,6 +747,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
>         if (bus->slave)
>                 bus->master_or_slave =3D I2C_SLAVE;
>  #endif
> +       if (do_complete)
> +               complete(&bus->cmd_complete);
>  }
>
>  static u8 npcm_i2c_fifo_usage(struct npcm_i2c *bus)
> --
> 2.42.0.515.g380fc7ccd1-goog
>

Thanks William for the fix!

Reviewed-by: Tali Perry <tali.perry1@gmail.com>
