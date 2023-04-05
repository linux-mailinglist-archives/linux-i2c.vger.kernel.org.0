Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834E56D7C89
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 14:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237312AbjDEM1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 08:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbjDEM1G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 08:27:06 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302074ECF;
        Wed,  5 Apr 2023 05:26:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r11so140639209edd.5;
        Wed, 05 Apr 2023 05:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680697600;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2aJztWyJMkiniehGauUEjLILnR2UL6ke5KvMESwsxE=;
        b=algQD9FxG85aoKu0mN+a+bGZzviO/Ha8RRUzd4R22pz4jH9q+fNYc53zoSy+Vx7EW8
         n3t4vy16t8oVrAV+L0vlcJcjq/01zIbZaGQmh4VrKE204bRrC7TklBP9LDk76D2N2tzl
         yumxlFyZAliQPQ/mKqdBgrBjS9cPiicOq2ujdw75QBJvu2dI/7hz5hfjlQ4fDZgAYY2x
         X69C7wIsHMBXsbXVVGMElWzJpoGD5kkV9rHXm3Aflo+7lobS2AY8OEPVYxALcpY6e/Sa
         33WXgFjNK5LXj7cT/dg5eEqa1r22hsTp7r6YKvTFE9uD23SL/nnCnetEeVM6Vu7Ffqy9
         vjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680697600;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2aJztWyJMkiniehGauUEjLILnR2UL6ke5KvMESwsxE=;
        b=q2lJsWtYk+jR182jvMZvFvPd5GnR7DlkxVeBNRvHJeBGbimayyjpRajlKqlLkw0ilY
         Xt84OeJbyeIADEScmOGgLshCq4MGxkCkeei7zOc68TmsB9hkMNnOESh3AlY52+x7c0ku
         fTpk1hl5Jr0LdaW7HFfCngi3z8PYHm8P9aAI8YWUXKB1+1ZiaGFiR4huXb7HxBACx40s
         RROf8E/1fGmxUJsc+XzJh12KNkhUVul/Qz3o41mgWsNtDYEnmQMaZSsWiBfTUftzJOEj
         dwqjJJNt+I9EoIJay34IJJ0Yw1vxN6u+/zwgV/Z4OYrpO2S+7kr0GrY53AiT+7yHqyGW
         RIwQ==
X-Gm-Message-State: AAQBX9fP4EOx6c5yaJoeYlvU5fTAKKkcSD4JUiw3Ki7KaTT3P8Fmalwv
        +065R6t1f8S+EUiXw+5ND+8=
X-Google-Smtp-Source: AKy350ayF4kT6zJXWP7/zjdUyYCIn82rb6azu9HwUNstbQhc4LsDBS8ougVF4xHP7ApNRnIicWwgWg==
X-Received: by 2002:a17:906:868c:b0:947:4828:4399 with SMTP id g12-20020a170906868c00b0094748284399mr2829283ejx.12.1680697600455;
        Wed, 05 Apr 2023 05:26:40 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090676cf00b00947c0cecceasm6686365ejn.206.2023.04.05.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:26:40 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:26:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: tegra: Share same DMA channel for RX and TX
Message-ID: <ZC1o_sIuQIfHg9pi@orome>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
 <20230324115924.64218-3-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hGLpMWdudz37EMFO"
Content-Disposition: inline
In-Reply-To: <20230324115924.64218-3-akhilrajeev@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hGLpMWdudz37EMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 05:29:24PM +0530, Akhil R wrote:
> Allocate only one DMA channel for I2C and share it for both TX and RX
> instead of using two different DMA hardware channels with the same
> slave ID. Since I2C supports only half duplex, there is no impact on
> perf with this.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 69 ++++++++++------------------------
>  1 file changed, 20 insertions(+), 49 deletions(-)

Looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--hGLpMWdudz37EMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtaP4ACgkQ3SOs138+
s6EamhAAv4b1zBgK/e6dZi4UXAcYvW4zrOPbfafutYP0oaj3V967WmuhGo2LN7Ij
p1ZmekWO7XPjj/ryNETIQAYWYAotdQMJkjLvVgz10Jp7iNXcn2mbrk1Frs7tQIZk
FJW1fCZEmpoM2tz2rxpf/+DAG1QcaRJMzuAKMRBCCjN5StRlZpOIOTrehafY1dWF
IF2bPQso0SC6dz1UTLnxwECd4Ir7tElMShUNSPqy0vRq/q+9TqAFFxlQo5BgOoXo
+wl5nPp7D5O7UiW0fs4xcFksIp0kxyLr06O0NtQ5NxkSp3W2Nrb863hkWnm3fELy
mcj0y+y0+JnJvU9KTRi8D+HtitRFdWl/wg1ZVZPH4rqjpcu0LmEWrvSiBLe4mV+K
Ft0jP8K9yZZ+gow6tn1l5MdxXiMBDc2vstSYxMxFjB9p/yfPWyWNGd0+3ET+RaXU
fvgm+Ao5MaXC2a6vxB8GBejaoR71Mr2Hv0P5tAhIQ4iVUZoyuBo0dzBC847oHJg4
rW8wpPPgscPX2To+Ss33TGv/WmO80pRiE8ycEUSCixV2Fj2W4/7SM0a8mgwGFGMy
UrWcbSNFFmf49GECos96cNBp4yNntUA6gazLphd4a0AUTA3SwhKyMlAhBxSSzvP4
NQjOAyov6rsmux+wF9N4j4U3w8+/1fP8+pkbX83rOKLpAIqR/gA=
=k57D
-----END PGP SIGNATURE-----

--hGLpMWdudz37EMFO--
