Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089B02722D1
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgIULnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgIULnZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:43:25 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2240C061755;
        Mon, 21 Sep 2020 04:43:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so12386066wrp.8;
        Mon, 21 Sep 2020 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GNImVP9jAJLJrmHRtFBtSucXxMa5mXZovk836ikl2e4=;
        b=itEawX9OQ6Bo9+is1C/sdUg/qyiwTtMjkB1xMhCy9Blbn+dToj725EitHIa83aZVLG
         IiXn10VRMeHF0vZ18CkPK4gtT4JFKhg8EaDRncHCv5EnakEB9oa+tvsLdrVIHHNyzL+t
         X6rXNxxh966k7FNre9x1Rl4bv2vF15zw6yWUi9x+q70qFUg9wIEaZCquMjJsHAxXaR5S
         WiNy15AXNh7oMCkJhZyELEhd+jLP9p+v40Zcx/q9fnCr5eieOnv3EhkOjVHMF4l9mwNh
         v1CEAC6V4bvknfMXwPOsUoQE5TgEn4FoSifDV2SywgXdznjIKzkSe/zTx8zc8Kvo7V5K
         W6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GNImVP9jAJLJrmHRtFBtSucXxMa5mXZovk836ikl2e4=;
        b=OojoYFdZx6fPgC5+R2cVLLwUuPTkSpC39u25rF/AKMInuVo7+MyMMPN3eDIlwEL8Gp
         kRlNv6y9YSOiD3u2OEonbFBw1LfxZh+jLIzePK4xUqU+sRca1O2wqKvqdv8HkFnxtktY
         2St3IC9A8wkzLKaJTZM7GAuPWb6Ds2Yqplhc+XEvtLlEC3ISyaKud6KSSG5UmbiPDF/M
         JEA5QYoP+g8hOYZekx3NRIBYum9yNIrKPUXojODR3HNTA4/M+OlxnTrTfY6se9fBqVFn
         wRfGBRkloLVqZ8WDkKBngFAFmCW19umpvQJLNbNUZLuo0XUn747a+tjJnBu6eLewAQBq
         E2bQ==
X-Gm-Message-State: AOAM533lDk4bghPwuN4lowh7XMYcEKZ9pnwQZisd9WUDE2Tjml6AQIiN
        VfDY73cFVCSQGJ47Odj0UX0=
X-Google-Smtp-Source: ABdhPJz+dLv1/wwhzHZ46nDE017tQB7YpBEtLBhrdB7NIO+man5ID+lQfnQvnO9ZAlfoRjw8pXckGw==
X-Received: by 2002:adf:a29a:: with SMTP id s26mr47908851wra.197.1600688603595;
        Mon, 21 Sep 2020 04:43:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k8sm19761519wrl.42.2020.09.21.04.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:43:22 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:43:20 +0200
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
Message-ID: <20200921114320.GN3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-33-digetx@gmail.com>
 <20200917123208.GK3515672@ulmo>
 <11a29706-0870-792e-d5d5-7c0d1f402281@gmail.com>
 <cbf6f8da-0e9e-3249-2173-bdccbf368bcb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Content-Disposition: inline
In-Reply-To: <cbf6f8da-0e9e-3249-2173-bdccbf368bcb@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:17:39PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 18:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 17.09.2020 15:32, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ...
> >>>  /**
> >>> - * struct tegra_i2c_hw_feature : Different HW support on Tegra
> >>> - * @has_continue_xfer_support: Continue transfer supports.
> >>> + * struct tegra_i2c_hw_feature : per hardware generation features
> >>
> >> I think that space before ':' can go away. Although that's preexisting,
> >> so could also be a separate patch, I guess.
> >=20
> > I haven't even noticed that!
> >=20
>=20
> Wait, that ':' is used only for the struct description, hence it
> actually looks natural in the code.

What makes the struct description different from the field descriptions?
A description list is basically:

  <term>: <description>

And it doesn't matter what exactly <term> is.

Thierry

--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9okdgACgkQ3SOs138+
s6FrzRAAwe7DA+pvwM7NqRBDmmCAlujDG55jHc82rrxXcrjBJp+dFqUuV/SXoVdV
i8jmqtbVBfqaLsauwqbwTDizyj+O57xduVIQ7E2yWXh/PKer2nXQX3Cz3SzJuM5s
XwndTodk9nTv/DKg3TEA0DxIHODfj1U5SYbftixGjEEdB9PfVxDK/R4Ze0zzcB0d
V8r+bZ8sLA1HZX5RnW2YX/2iAmUiM817eG4FzOy+E07ISwLFJv/GTwQEm5vqZ2pu
sKaI4xeUtOnGfEQSu5OJeyvN8alXZi8iKTR6RfStdEtnXLFywPpUboJl1R+LPEOw
yYSAw74UvKbVPyq3ElMpnguXUcIeiRQ6MD2TmXU1GdeHdrTYYUj1V6fsnnsjN5g+
VyjxgPtlj4ZxFHZGPfMBVGBpKOxqIfWP/97nGmTqx/YmnHmO51C/2XHFoXLT7LQC
py+jliikfrzX7eq6fyKJL9rs4BbLoUvM73XPfFYZGpZ+HhVJCifEc7DGGM3tu6ly
+hK7z0NqLPhUw319DqJRhT8cZCAoMS+iLtxpBjJg3R60rLkdIOPspfxQrO7j3Htq
s5+W1V82KOEWRcZx0uojUnGytlCOz1burDfiA8AhnTtKcd7DDW1UAdI+dc2gwtbr
hYOc8vamlJzqW0gaUGW/T8dLWbYM3m1bUIUdg/zAVIAuFtWbddA=
=2duQ
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--
