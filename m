Return-Path: <linux-i2c+bounces-147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6987EB066
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 13:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E117A28120E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EA63FB3E;
	Tue, 14 Nov 2023 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djIpqb7C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AC3FB34
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 12:58:00 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7382D4D;
	Tue, 14 Nov 2023 04:57:46 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso8633742a12.3;
        Tue, 14 Nov 2023 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699966665; x=1700571465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJjJKHUZUNOQdXGf9Dy6Kq7pWnEcJwiJCLLR5OWai7w=;
        b=djIpqb7CuHruhDOGUfkXdK/lEOo36LJzpi3tEoQR4jpVF+sXPh+j+Jr3j/Z6Ig/WFN
         i/GBG0nsELCdiS7N+fgIQFs5ikdSXubfNy2fSLzgCclvnG9BrsU05DOw7WfhsP3QJveB
         IfRLRWz9SkjtyxVA/15RdkGOvar/aecUhIL/vbbGyxXQAiC9cOMDffMvMDA9ilvmrNGb
         6K+dC/jZpPNkeeP0Mvc1s3iCHZQXr9vCQTg33q648M3EzkiolO3TI9tOgO3IY6VOw47E
         scYyxHdqp3vV/v5s0NWK1VhssWL4MFbvqu/DOe7I4CUkM0FELUCkbeM2YSnSuHBhhANH
         DyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966665; x=1700571465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJjJKHUZUNOQdXGf9Dy6Kq7pWnEcJwiJCLLR5OWai7w=;
        b=EDA9WBVR/db4LvdQnmvIoyWGm0EKteJw57KSLUtEEw0Se0tErOPR6TkvcfMqErx48y
         QrPKRz7sDPzZoIGdWahSf4UNQPYNki06hXQSYhHCovOa5lFeuBFVzrx9kTnfLCIeDt2X
         +lmL0KBN/i0B8nGgRRHrUVLYAnjl50OMeFtCgh4unq+UaX8eBHhwbedtnYix9TsByyPJ
         cuQJMTn+5tl0A/O+O3WWYpN0qqnhlI9cHzBJOPK4mALf71lB+hhPknH+gDHE7NcMw0hE
         Vn08tKeiotIgFenD/A6oI/nr4jb5q+CjdnUs3TKw2QNbPHel4LObawoeykAf+6dTH2uX
         2YtA==
X-Gm-Message-State: AOJu0YwgBRKAVGt7zzsScy/p/g6KFCDssAAObo4RfQ5ihmtCECXldokH
	EzTXeBL/qlw6339dLR4vGVIAX1VDkRlMtxGFvuQ=
X-Google-Smtp-Source: AGHT+IHgRd3gNlLXkJM9oqK5fEqaNFkOqkCsKijQhqu/BmgP88zXwR1Br7dHJnsSppo3pBXT6VEnVfgmwS/fz81trQs=
X-Received: by 2002:aa7:d316:0:b0:545:4bf3:ac89 with SMTP id
 p22-20020aa7d316000000b005454bf3ac89mr7125996edq.23.1699966665174; Tue, 14
 Nov 2023 04:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231112225444.4487-1-wsa+renesas@sang-engineering.com> <20231112225911.4650-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20231112225911.4650-2-wsa+renesas@sang-engineering.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 14 Nov 2023 14:57:34 +0200
Message-ID: <CAHb3i=tTvK9w4LgAiHhORWK-d3W6HKwGTv2BSAPTDc4siVkP9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: npcm7xx: move to per-adapter debugfs directory
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Andi Shyti <andi.shyti@kernel.org>, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 12:59=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The I2C core now provides a per-adapter debugfs directory. Use it
> instead of creating a custom one.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index ae4bae63ad4f..54181b3f1919 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -326,7 +326,6 @@ struct npcm_i2c {
>         u8 slv_rd_buf[MAX_I2C_HW_FIFO_SIZE];
>         u8 slv_wr_buf[MAX_I2C_HW_FIFO_SIZE];
>  #endif
> -       struct dentry *debugfs; /* debugfs device directory */
>         u64 ber_cnt;
>         u64 rec_succ_cnt;
>         u64 rec_fail_cnt;
> @@ -2250,27 +2249,15 @@ static const struct i2c_algorithm npcm_i2c_algo =
=3D {
>  #endif
>  };
>
> -/* i2c debugfs directory: used to keep health monitor of i2c devices */
> -static struct dentry *npcm_i2c_debugfs_dir;
> -
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>                                   struct npcm_i2c *bus)
>  {
> -       struct dentry *d;
> -
> -       if (!npcm_i2c_debugfs_dir)
> -               return;
> -       d =3D debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_d=
ir);
> -       if (IS_ERR_OR_NULL(d))
> -               return;
> -       debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
> -       debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
> -       debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> -       debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> -       debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> -       debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_=
cnt);
> -
> -       bus->debugfs =3D d;
> +       debugfs_create_u64("ber_cnt", 0444, bus->adap.debugfs, &bus->ber_=
cnt);
> +       debugfs_create_u64("nack_cnt", 0444, bus->adap.debugfs, &bus->nac=
k_cnt);
> +       debugfs_create_u64("rec_succ_cnt", 0444, bus->adap.debugfs, &bus-=
>rec_succ_cnt);
> +       debugfs_create_u64("rec_fail_cnt", 0444, bus->adap.debugfs, &bus-=
>rec_fail_cnt);
> +       debugfs_create_u64("timeout_cnt", 0444, bus->adap.debugfs, &bus->=
timeout_cnt);
> +       debugfs_create_u64("tx_complete_cnt", 0444, bus->adap.debugfs, &b=
us->tx_complete_cnt);
>  }
>
>  static int npcm_i2c_probe_bus(struct platform_device *pdev)
> @@ -2362,7 +2349,6 @@ static void npcm_i2c_remove_bus(struct platform_dev=
ice *pdev)
>         unsigned long lock_flags;
>         struct npcm_i2c *bus =3D platform_get_drvdata(pdev);
>
> -       debugfs_remove_recursive(bus->debugfs);
>         spin_lock_irqsave(&bus->lock, lock_flags);
>         npcm_i2c_disable(bus);
>         spin_unlock_irqrestore(&bus->lock, lock_flags);
> @@ -2385,28 +2371,7 @@ static struct platform_driver npcm_i2c_bus_driver =
=3D {
>         }
>  };
>
> -static int __init npcm_i2c_init(void)
> -{
> -       int ret;
> -
> -       npcm_i2c_debugfs_dir =3D debugfs_create_dir("npcm_i2c", NULL);
> -
> -       ret =3D platform_driver_register(&npcm_i2c_bus_driver);
> -       if (ret) {
> -               debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -module_init(npcm_i2c_init);
> -
> -static void __exit npcm_i2c_exit(void)
> -{
> -       platform_driver_unregister(&npcm_i2c_bus_driver);
> -       debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> -}
> -module_exit(npcm_i2c_exit);
> +module_platform_driver(npcm_i2c_bus_driver);
>
>  MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
>  MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
> --
> 2.35.1
>

Test pass on npcm8xx device.

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks Wolfram for the patch!

