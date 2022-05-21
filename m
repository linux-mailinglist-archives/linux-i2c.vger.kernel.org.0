Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3968752FA88
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbiEUJut (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 05:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiEUJut (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 05:50:49 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D4B2629;
        Sat, 21 May 2022 02:50:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DD8DDCE2E69;
        Sat, 21 May 2022 09:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925E9C385A5;
        Sat, 21 May 2022 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653126642;
        bh=uaaM0Cjy5At+m2+2W/vgkDuhCtA4C/pIjvqMBjYomig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o09q9TxCsHyoaxP7s7m9wOfm92doxcU2km+pAfK8RjYrhAAzHnJLrEfbgwF9KYOBP
         1Qu/li89M7DFkzk290qsvpliMSyhV3C0xOqtuFhxxs648Sm3O187acMFgDZBr0C9gc
         E7T0bAgUKTMHut585ymJeL+x8YKxcgYdASW3dJ7engXCX6fv+2FkNbiozKZeKofwfI
         o4pYFI2lGuM7s8UTrkfjimXl1CGXegAsy9L7bS+q52XJ8RBtD4He+WMvzofLHgIQsY
         Ndv/rpIHRd3Rzu49aYzcpKPksrNM8VqC0B+kzFyPRUtOkZTLiyWaxP1nq3Ivggvza5
         U2i2Oscw71Z/Q==
Date:   Sat, 21 May 2022 11:50:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Workaround false-positive LOCKDEP in
 delete_device
Message-ID: <Yoi17igIZH7y2Hy0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517075518.43613-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DSqDDRpdOPhPZOr7"
Content-Disposition: inline
In-Reply-To: <20220517075518.43613-1-alexander.sverdlin@nokia.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DSqDDRpdOPhPZOr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			/*
> +			 * We drop the mutex here, because device unregister
> +			 * will take sysfs lock (kn->count) which, as LOCKDEP
> +			 * would think, depends on this mutex
> +			 */

I have to ask: can't lockdep be fixed or the lock somehow be annotated
to prevent the false positive?


--DSqDDRpdOPhPZOr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIte4ACgkQFA3kzBSg
Kbbjiw//S6QYqyXF0+7giGEfdZSOTR/kUqvRR/PLW1gAJE1nxbySa2Muoc0CwBHB
bi5zD9vQzRDMXnXKCFWpmXjjK7ootaSoo0wqKic/takinhfJn2P2+MTOtQbNhyEX
fjSHkc/MZN7cfimLU0PhXXBBFq+ixiqMR3TCwJ0SmLsOfyW00OHGkm2d0YgyRDjn
ahgwhAwmzMGHhyPfqsoLhyp9nu88RinNwvMiljCuLlGPZ8ykSV3gg6oEpcIaAkq/
iLiNiLN8Zfy91FP/5Rk1ZLdonCq8VDIY9/wiu9V5BF9Yr1+MhLTbeDk19EEfVlHh
xH7CPbf29vkSIlYEnd/e6zeQEan+NY1fuZDPktoE0drz8TMM0e1fZKtwdaUNcGqO
0mgrF+GpWdcyVthKcJ316+O3xZ5xlYJivchsFsrm8iMvBWTR5fJXJ8PLwsd/oeKA
fGojnGmMXG9p2MWsM55AZOtgrXtMPmfnrVHemu2f9aK8RCkjkO37vPwkpiun6hbS
VnQBeQfrOvtPPVHiD44IYq6wM2HmmLM5GLbsNoXiZFQs16lOlGl3MkQ2WspvyVk7
WOb+RPcpVCjFKed3U+az2Swltzu8irw2akBaHv6jmfvpDn8dQ+YThpNVR43hECGr
AEtqW/6F1HzE6F3wibSIPoub+OBGsZR8dlRTZhuxiHd9fZ7+gT8=
=gAZT
-----END PGP SIGNATURE-----

--DSqDDRpdOPhPZOr7--
