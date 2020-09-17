Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949C926DB9A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgIQMcz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgIQMcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:32:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75684C06178A;
        Thu, 17 Sep 2020 05:32:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a9so1873140wmm.2;
        Thu, 17 Sep 2020 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FIH3VcDXq4V94tL9If4fuwbw/qKNh6i3j/t2acHJLj4=;
        b=g/jYibskeo4VoYVh+3EUft1RyKUeeqTQqdPSVFPr/fJsiIBVPbKpYEqvtNjXaBg4Lj
         Bxe/1YZiLA4oM4shK0ZJmQkNEqc3KCgzZuxj695pc9lhoxVCZmiJOeY6OmYame/6LbWw
         1q7aH3FDvA58XBO3wJe0BcGD4qnOj1Lj/rXi2W5drd+niQA5Q2itzXZV6nrPFz4ms81X
         Q1o0PFnF6oojAKwcWNmZIoXwMVkt35RohYZE5AGuLL5ibp5jit4sIJ18h3IhfgIx92YF
         JGbf1sLbB2CpqS4+EOI2ZoYH3d9fe3xGcqyERl2PlkZmStAg+E+/ISLxvD/7qKhPDt3p
         /m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FIH3VcDXq4V94tL9If4fuwbw/qKNh6i3j/t2acHJLj4=;
        b=Mme62xIa0tRPb56nxsbQTtYwlwaR8f4QovJpQmXj7+B7JgLEnVDn6l1TsfFLZp4pvS
         E1rGIcwH9U5GJj4MVHKTD/Fdo4D2TUY+Et0q/9NuEdfRBXlO/d+3QoXjaQEjzu2W5ZPU
         AVwGOgtPUaB8tVA2vS3BnkO6iuZbjaEW/FLZye2Y4GxKkhqm/UXKE3kZJ1DbwYNyjHPU
         Gt7VKKTlb5b1gKwYghnx3G5M3/vBfGkgm5XRo1KpnIi1Ghj/8A8efouDBO5bDTRYh0JB
         PGqy4hTM6r5czIHYK1Awi0RTc1VLI2Oxizjtf9BOvJNu1QWlE2RyWQ17932C7aLU0H+1
         TNAw==
X-Gm-Message-State: AOAM530fDXyvVLaW/+mhUxd0P6jJ9NwpahXv20EVhQyGhK7XJCySz32T
        65BQ+5UYPmkGRnAcHKvT6ew38hs65n2IWg==
X-Google-Smtp-Source: ABdhPJzDlvLlyHEgL4czsFCLnRuyxE3eJpFgb8lsCQaulTUKv/3HC2So8XF3jPuQpbikaT91EsEG1g==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr9525832wmi.19.1600345931071;
        Thu, 17 Sep 2020 05:32:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q186sm10986022wma.45.2020.09.17.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:32:09 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:32:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 32/34] i2c: tegra: Clean up and improve comments
Message-ID: <20200917123208.GK3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-33-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YaSFhaLO3hpMipqe"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-33-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YaSFhaLO3hpMipqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:04AM +0300, Dmitry Osipenko wrote:
> Make all comments to be consistent in regards to capitalization and
> punctuation, correct spelling and grammar errors, improve wording.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 88 ++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 558b1f2934a0..31fbc6181dd5 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -136,7 +136,7 @@
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> =20
> -/* Packet header size in bytes */
> +/* packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
> =20
>  /*
> @@ -148,11 +148,10 @@
>  #define I2C_PIO_MODE_PREFERRED_LEN		32
> =20
>  /*
> - * msg_end_type: The bus control which need to be send at end of transfe=
r.
> - * @MSG_END_STOP: Send stop pulse at end of transfer.
> - * @MSG_END_REPEAT_START: Send repeat start at end of transfer.
> - * @MSG_END_CONTINUE: The following on message is coming and so do not s=
end
> - *		stop or repeat start.
> + * msg_end_type: The bus control which needs to be sent at end of transf=
er.
> + * @MSG_END_STOP: Send stop pulse.
> + * @MSG_END_REPEAT_START: Send repeat-start.
> + * @MSG_END_CONTINUE: Don't send stop or repeat-start.
>   */
>  enum msg_end_type {
>  	MSG_END_STOP,
> @@ -161,10 +160,10 @@ enum msg_end_type {
>  };
> =20
>  /**
> - * struct tegra_i2c_hw_feature : Different HW support on Tegra
> - * @has_continue_xfer_support: Continue transfer supports.
> + * struct tegra_i2c_hw_feature : per hardware generation features

I think that space before ':' can go away. Although that's preexisting,
so could also be a separate patch, I guess.

> + * @has_continue_xfer_support: Continue-transfer supported.

This isn't a proper sentence, so I don't think it should have a
full-stop. And it shouldn't start with an uppercase letter, either.

>   * @has_per_pkt_xfer_complete_irq: Has enable/disable capability for tra=
nsfer
> - *		complete interrupt per packet basis.
> + *		completion interrupt on per packet basis.
>   * @has_config_load_reg: Has the config load register to load the new
>   *		configuration.
>   * @clk_divisor_hs_mode: Clock divisor in HS mode.
> @@ -184,7 +183,7 @@ enum msg_end_type {
>   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface=
 that
>   *		provides additional features and allows for longer messages to
>   *		be transferred in one go.
> - * @quirks: i2c adapter quirks for limiting write/read transfer size and=
 not
> + * @quirks: I2C adapter quirks for limiting write/read transfer size and=
 not
>   *		allowing 0 length transfers.
>   * @supports_bus_clear: Bus Clear support to recover from bus hang during
>   *		SDA stuck low from device for some unknown reasons.
> @@ -245,7 +244,7 @@ struct tegra_i2c_hw_feature {
>   * @msg_err: error code for completed message
>   * @msg_buf: pointer to current message data
>   * @msg_buf_remaining: size of unsent data in the message buffer
> - * @msg_read: identifies read transfers
> + * @msg_read: indicates read direction of a transfer

Hm... "read" is the "direction". Perhaps "indicates the direction of a
transfer"? Or perhaps "indicates that the transfer is a read access"?

[...]
> @@ -1797,9 +1804,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(=
struct device *dev)
> =20
>  	/*
>  	 * VI I2C device is attached to VE power domain which goes through
> -	 * power ON/OFF during PM runtime resume/suspend. So, controller
> -	 * should go through reset and need to re-initialize after power
> -	 * domain ON.
> +	 * power ON/OFF during of runtime PM resume/suspend, meaning that

s/during of runtime PM/during runtime PM/

Thierry

--YaSFhaLO3hpMipqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jV0cACgkQ3SOs138+
s6EtOw/+MERtG5U90+lebtyZO7QUSwH36CTFzt1LWUXuOk9tpU25qgv/9cVIv50z
yF3ygzamdA8JqEEAic6DBsOd5cCMicw/wVBGXnzE+/UtFA5QW3JuH/l18RBDqNRZ
wffHsV/qihWkeyvsG4pSM7Out3dzltwPhzv/D+zyE4jGs47TM1e4c5T1D+8KGnVa
ZYICqUcm+UeomkaZlpDNdB6J1QGUwc4Sc8izbjIFmTou1aPFsNW3BJYtTLzIni95
2/ZoAIFR0Nsn0l1ZostUABZUTVR6vPRyRT1c+0qJ75u1/ZaSvA0KfqBJwrfaCgag
NBav0ILwy9EJkuKvYqkYm4Wq5s8ttSSArSqGAz8eiDBlFGFiGSKqiTr5ntqimmbH
n8zHxCRmTaBYghyAZT3biB2gTlxSa7SuD5DR/yDDcD/2fYzOFxNWFdQ7rLygo5yP
bYzlHy4x4p4UYfcVp6WjlTQlMghazm1mpZJYIYs0Lz77Defn9LA8ZQ9WKaxIeavR
X7fs3Xu4LYbd61QRt1/j3hGLaShKzudJZiEHsdRCzYYIMo2u3ZgntKyatNbhmSiP
y8nULwKZSoPpejRisrt7YWa/cYeVVLyYZzaX7S/cRnQcv/nAJPyhKC2cOJWJZUgH
XO6QB4OxJRkdyaJtwudPVNm7hWfSB1i29PL5EjF15VedOhej+90=
=IAbk
-----END PGP SIGNATURE-----

--YaSFhaLO3hpMipqe--
