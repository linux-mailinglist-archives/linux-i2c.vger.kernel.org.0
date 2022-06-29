Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B718560A4C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 21:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiF2T3E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 15:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiF2T3D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 15:29:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D4310A7;
        Wed, 29 Jun 2022 12:29:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50B01B824F3;
        Wed, 29 Jun 2022 19:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56023C34114;
        Wed, 29 Jun 2022 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656530939;
        bh=K06Oo7hqUeLYaNucOdTDB8gKJH0ahLyqJbNtJFxKJ3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VFjogmOW7gfBRZqg74qIWzu3qHPmENOKtkzL/h3pZYXQiA1f9AKnzLfzhd6m4QS8O
         od+Zg8wX1Rw57CgyYoV98jTqGCzVfE9CKPB5hM9DXAl3om28uDhbuefIIAjSn1Ba5y
         apaYmvAMsEvDE9pe9kUxj+t4UgKkL/Lzi5n8cv33hWoADUB3+7G7rshoLc//kujXJv
         IuVjWCNAWHR9+8jPJMQTxlEnUnNAx5+33dXXf0ov7/z2w8AVnLZY3ci3RMRypUsKsh
         j4+RoYbfmhxEg5Awck2auRQ9GbOOJr9TL6nBnKa7hHKK6/9zJX89NjYGiBEhwUD+vL
         K1ZJolelBC42w==
Date:   Wed, 29 Jun 2022 21:28:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery callback
 checks with CFI
Message-ID: <Yryn8PdQIH7RaUwO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zhipeng Wang <zhipeng.wang_1@nxp.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N97gfHEXjnT999XI"
Content-Disposition: inline
In-Reply-To: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N97gfHEXjnT999XI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 28, 2022 at 10:41:55AM +0800, Zhipeng Wang wrote:
> CONFIG_CFI_CLANG breaks cross-module function address equality, which
> breaks i2c_generic_scl_recovery as it compares a locally taken function
> address to a one passed from a different module. Remove these sanity
> checks for now.

Can't we better fix a) the code or b) CFI?


--N97gfHEXjnT999XI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8p+wACgkQFA3kzBSg
KbYPCw/+IKsMGObtIb4+5Ua7dqCt2Hitz100em1m7cYyvUGZEpM20A8j39uNsisy
MSAIyDGZxSg6FVrO5To5HQrmhqX2rUeO494ZwhSgKrPPkh62PhQoF6CgBK/nQf6L
SQCmlq4pLeb3J+0SmHXGi4sfc0HimiHCtLAulNeifS4vBTu6EA/SMjPPoxDuLgrq
pvkLF7mOn0qkPP4e0bof2xOJ6naxlSevsWrEO1hZemlxcVORPXg4l79epGxMTm0g
aTa08oyZb2tImoW/16yejhUemYVWtHb7iOWYQ39xxziii2DYYQCR6WaMILJPJyou
4jppurTkt+tsXvtbOhcZU8ROtw2Q9IbwaAxRpQ7jiWjYklGVwlT8W3Nw6WMUyqN9
NuncNapTv+TzoglreYZj4hncBgr5Or8wyDb/LgQ+MiJ/yAbR2SFhRTR0rZi3OPU+
36JHs34xPoJuTukHJrM3tORop2oKuFw2f4hVqZLxVIOD+LXDpdvtTGwp+KdI3mUr
8sBl+DFYEZ/3fzHW1Fxd+sJiU6kpuYMGT1Pjzgsf90M1RhefNeZRr4ufi3adnb/B
DBoQdCBKa5VUWBQjDD6nATTa9lzqoKRRVhWt4FB79mOxICp23Fidvi9+WUQUR1ui
ZvYW8bQGG4H96+pDiHmIdxpO5uRyvlg7Y446e5RM0Z19FS4EQxg=
=rZbm
-----END PGP SIGNATURE-----

--N97gfHEXjnT999XI--
