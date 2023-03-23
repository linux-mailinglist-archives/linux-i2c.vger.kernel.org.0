Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108306C69F7
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 14:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjCWNwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 09:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjCWNwY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 09:52:24 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF557ECD;
        Thu, 23 Mar 2023 06:52:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y4so86971839edo.2;
        Thu, 23 Mar 2023 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679579542;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCM/asaxbLHdp2e/d8AVFh0bmUGqAzxZv/hf4ha4l9Y=;
        b=pstVBkDnZrmssUIUYPZjpk78j5pcOe/MM4ApJ+Yu3jCuurIPGxpCrbOLxR0S4ssq+7
         YO69iekwuVXT/hy/xGmfVE3jgGvj4NFBTk71kmjq9JC/lsPAmab78B7EjYBBG2VS5LeJ
         qJcliefH9FqPYxhQLyVb804kpIyGUud27JhznW1tmUMvuJHKaQqOEhYeQJEzISmpynKL
         qoT/X12DnPqa+pSP5aDBwxSssOqDBzjQkutyXJRaLz5C0NZUznnJp805jh5prRKQ4wNj
         tYrP17M+XlJoXkBsJgTVUJxtl0KTm5wHaoQDJuGvs7CI0c70nMaAuAu8/86Zyu3aCeK1
         hWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679579542;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCM/asaxbLHdp2e/d8AVFh0bmUGqAzxZv/hf4ha4l9Y=;
        b=OpOny3kPVxxroWsbTTXIKpf0l5baUs0QM7R6WyZhL6MCMdbhHrEQdZjHXa6FUqS/6i
         R0WwT2SYMTDKBrk9VZO6XLE9lrPmqn1lQjNPQTuOuMWz810vPGLLhgGoSkI+sM0ow6IT
         iRCryCEPtMedd3o2N7TC98BmEnuvugXKTrMSSlpONMonhIRHvFDhFm0jDI7xrTPe5kFB
         /TbxPno0Fmnr88JbW4cyNSB8KW8Xzri4l9lLZ+whYUWWy0SuRRaLcil9NICicmteq7sG
         uhkv1TSmAoLMw4+31dZ/ljn0YFvPs4TS6S366tM93ejvEudqCTDC0tlStZpc9XffmqQF
         KjjQ==
X-Gm-Message-State: AO0yUKV2Z+f1CCVwFMgCsdcRhVChETEBVNW7sqVzRurJJIs+b9rBEFO9
        GOtlvYK8qQOJGAvU28GNSmzJj6kLQqI=
X-Google-Smtp-Source: AK7set8/7bvQOIV2HCFliHXd5hevFPhZ2APdmoa3kx1pSVhz43v62G9Mz96w5R39l2XvFhyIFuT9Ug==
X-Received: by 2002:a17:906:c01:b0:930:27c2:6d8d with SMTP id s1-20020a1709060c0100b0093027c26d8dmr10885715ejf.61.1679579541914;
        Thu, 23 Mar 2023 06:52:21 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v15-20020a170906858f00b0093229e527cdsm8248292ejx.42.2023.03.23.06.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:52:21 -0700 (PDT)
Date:   Thu, 23 Mar 2023 14:52:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Message-ID: <ZBxZlNOhLyUZi1B+@orome>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
 <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
 <SJ1PR12MB63395F16F399E67733EED69BC0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ZBwg2Rnc6d5EQ3pu@orome>
 <SJ1PR12MB63391B10B3F73DE89A214486C0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CcE1zS+p41bOMhG1"
Content-Disposition: inline
In-Reply-To: <SJ1PR12MB63391B10B3F73DE89A214486C0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CcE1zS+p41bOMhG1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 12:16:23PM +0000, Akhil R wrote:
> , Mar 23, 2023 at 09:26:00AM +0000, Akhil R wrote:
> > > > On 22/03/2023 12:00, Akhil R wrote:
> > > > >> On 22/03/2023 10:24, Akhil R wrote:
> > > > >>> Allocate only one DMA channel for I2C and share it for both TX =
and
> > RX
> > > > >>> instead of using two different DMA hardware channels with the
> > same
> > > > >>> slave ID. Since I2C supports only half duplex, there is no impa=
ct on
> > > > >>> perf with this.
> > > > >>>
> > > > >>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > > >>
> > > > >> Just to confirm. This impacts all Tegra devices from Tegra20 to =
the
> > > > >> latest. Does this work for all Tegra and the different DMA contr=
ollers
> > > > >> that they have?
> > > > >>
> > > > > Yes, It should. I could see in the APB DMA driver that the same c=
hannel
> > > > > could be used for TX and RX and the direction is configured only =
during
> > > > > dma_prep_*() calls.
> > > > > I did not test it on a Tegra with APB DMA, but since it works very
> > similar
> > > > > to GPC DMA there should not be any impact.
> > > >
> > > >
> > > > OK. BTW, this does not apply cleanly on top of -next. It appears th=
at
> > > > this is based on top "i2c: tegra: Fix PEC support for SMBUS block r=
ead"
> > > > and that one needs to be applied first. This can be avoided if you =
send
> > > > as a series.
> > > >
> > > Oh. Okay. I used 'git am --3way' when I tried, and the conflict went
> > unnoticed.
> > > Shall I send a new version on top of -next?
> > > The two patches were added in different contexts and that=E2=80=99s w=
hy I did not
> > > combine them as a series.
> >=20
> > It's usually best to combine them in a series even if they are in
> > slightly different contexts. This is especially true if they cause
> > conflicts between one another. If you send them as a series, you can
> > resolve the conflicts yourself (you may not even have conflicts locally
> > if you create the patches in the same branch), but if you send them
> > separately the maintainer will end up having to resolve the conflicts
> > (or apply in the right order).
> >=20
> > It's best if you resolve the conflicts because you know better than the
> > maintainer (usually) or specify any dependencies to make it easier for
> > the maintainer to do the right thing.
> >=20
> > But again, in the vast majority of cases, it's best to combine all the
> > work on one driver in a single series before sending out.
> >=20
> Okay. Got it. I shall send a new patchset with both the patches.=20
> Can I put the patchset as v1 or does it have to be something different?
> Because this patch is in v3 and "i2c: tegra: Fix PEC support for SMBUS=20
> block read" is v2 now.

Best to keep versioning. I'd go with making the combined series v4,
which is probably the least confusing. You can technically also make a
combined series where each patch is at a different version, but that
would probably confuse people even more.

Thierry

--CcE1zS+p41bOMhG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQcWZEACgkQ3SOs138+
s6EzDA//SdB03eh7tWga1ZsnAih5+Omq8AJYQIDmz+s5HtoaIRGPusBKVkK5yaJ3
uJktcFq9kXRDaCQs3lryqnAdGqD4gEHJuJVh9jGJCkDzsO9NvuIiVfWDVy2GQRMW
8Xpi5UpGu5HBelXx1rOFUP4kLPTp/4Br5zdatxqgCKn1eIucjVLQ/dVrthpmA6vf
8oXwm73XD4f25YHfOnUdtQb+8aHNs7O4iB8xcAEg1F5K8B4/CIykorGEVrazXmUM
mvNEevVeg/Dww+yr3oGgM+YRWnYkJUt8mmHOsBQcl42nR9JRRvdH0yS8RZ3QLcNZ
cJbSe65tMbgvde0+nHznaUVdYn05sxoorYSwZR7RCWKFSWN0ffc9yNxh5HKiezpS
QHO/eMl//NiAz6qoV0PCucW+d2ClY4sPIW8pxE3w8FmvXP9KR6yiavSa0eHYg9iT
FW4KvW/Dbkjq1K4AoYaUp+hnnrUtNGmx4f4lvxWNyFVucOcXfZK5WHd9FvJf5f+B
sSFQdvK8NFDOugtfXOPUN4NZQfHZz0f2OXASiQXlWWYGgIwyU0i6y5r1j4Hw6Kei
3OhC2F5+J5qPUVpCl5CFFhx0TjRNpnT6aztrdJZkUPGO7fa1CMBjcZLyRevokwKJ
RNFa2DOCXdJbSOKtU7ZPl4FNvnLZVyhwtpBUZlzIZddC+IAvpCE=
=TrYq
-----END PGP SIGNATURE-----

--CcE1zS+p41bOMhG1--
