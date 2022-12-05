Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA30D642644
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 11:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiLEKB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 05:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiLEKBy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 05:01:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF2EEE04;
        Mon,  5 Dec 2022 02:01:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82724B80D8A;
        Mon,  5 Dec 2022 10:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEE9C433D6;
        Mon,  5 Dec 2022 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670234511;
        bh=JzpFDEjrQFvjOi2I0p/4SK+qj9QDFZJNMZL7IvIyZ+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s1XSEisnYeBkj9lpqoXuvM0I8fTReUG9gMb+HWuYURInEoJkg8hOj5jk1tmKw9j54
         qfuliLepr4XO0kgXXrTPdbRAzHTCmUP0V47Fno2sX2ENbfBSOu/6keB6HSEiA3/CkY
         VG0/kiX3MassJ3HUCn87NanxqCta1yFnd1va6QKBMYslDeupVnKbMq+iO0xk8eOOi9
         bEy1kkEiKS+HsINl3fFMog90GN+ZTgWUrTATdB+wnKMnpcgdax8jZ+CZ0TXaEfrzLh
         SQH74AGk1uErAwGTN98zLPlJ1Rxq+Cb3Ie71yvr4ZJvQHsxSggk1ryNZM7LIoxoVEA
         DoWLs68vSeapg==
Date:   Mon, 5 Dec 2022 11:01:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hui Tang <tanghui20@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux@roeck-us.net, bence98@sch.bme.hu,
        linux-kernel@vger.kernel.org, weiyongjun1@huawei.com,
        yusongping@huawei.com
Subject: Re: [PATCH] i2c-pxa2xx: fix missing pci_disable_device() on error in
 ce4100_i2c_probe
Message-ID: <Y43BjGqsk+u/Nb+C@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hui Tang <tanghui20@huawei.com>, linux-i2c@vger.kernel.org,
        linux@roeck-us.net, bence98@sch.bme.hu,
        linux-kernel@vger.kernel.org, weiyongjun1@huawei.com,
        yusongping@huawei.com
References: <20221114092540.247891-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nPhuWi1wxt0t7EzF"
Content-Disposition: inline
In-Reply-To: <20221114092540.247891-1-tanghui20@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nPhuWi1wxt0t7EzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 05:25:40PM +0800, Hui Tang wrote:
> Using pcim_enable_device() to avoid missing pci_disable_device().
>=20
> Fixes: 7e94dd154e934 ("i2c-pxa2xx: Add PCI support for PXA I2C controller=
")
> Signed-off-by: Hui Tang <tanghui20@huawei.com>

Fixed the subject to "i2c: pxa-pci:" and fixed this checkpatch warning:

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<titl=
e line>")' - ie: 'Fixes: 7e94dd154e93 ("i2c-pxa2xx: Add PCI support for PXA=
 I2C controller")'
#3:=20
Fixes: 7e94dd154e934 ("i2c-pxa2xx: Add PCI support for PXA I2C controller")

Please do that in the future. After all that, applied to for-next, thanks!


--nPhuWi1wxt0t7EzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONwYgACgkQFA3kzBSg
KbbnNw//czGgLmhbY/RlYuNU83wTfRkheJRUsZDI2tiahuzOe47VBAIo0mFmL1+j
Jkd2UIWt6b0XIl5wSYXa+4oI4xO+7IQf3xtcC92P8EQP0/pqFIhekKwgZu57nqX3
YSf/ECv1hj0YHlbUWoRMbsK3vx8F57sQ+RP1Q0GJK5LBul1jNlRZbxb+/7CMDClZ
bCbT5YSIrd6izVLjgyEtDHnLKYVjIPMsx3MUQPbByeBS/4dzyOSWp19skH0Mppmj
F9wwN4/EJ7TJ3ymqeSCVIETQh5O+BxYO6gz/ha/hl9nO8K/Xt3E2NysrUmxbaHy7
zXMjGHXdFI5KB0p1+iU1dlglcbJ9aay2FOzldDnNFxuIJkX33EHzblql5MZWBaFK
9Kc8PEhTVlndQtrjyqXxV797vlLerNxaubttMVZMhv+WOk5UpfMy/nXECUEgzGRz
6JE1lQSRKSXnKE2Q8VNraeHlcnbQaKsuq5gx02QV9sf5sIpMyOioVXR0dmTJHPv4
1w9IV6xC8Pi9bKe3l/NBhxwI4APF51y48+K62IzpoSbeEgAkPv6CH/fQ7IWbNGWV
xO/oljClb1hkSTPFq4R2Mj1xyzSOsX5AuobihaXoxvybeZ8UPIl+dbyqTL6L9F1A
S37wHTj7Rb0EceHDHB7FNLOlSISrDe35oGRNKX0t/E/ikjHxkj0=
=sQB6
-----END PGP SIGNATURE-----

--nPhuWi1wxt0t7EzF--
