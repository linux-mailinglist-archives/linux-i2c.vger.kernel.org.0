Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E6072F7FD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbjFNIjr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243629AbjFNIjq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:39:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFA6186;
        Wed, 14 Jun 2023 01:39:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09E296317F;
        Wed, 14 Jun 2023 08:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73EDC433C0;
        Wed, 14 Jun 2023 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686731984;
        bh=VfYi3lHZUB88p+a/ita7xZrp2l7Zlz0XIpxHxqCDIT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJF8IW4YWfWpQSPI1t4wQQqGhiKqEyNC2TGMO1a3SOcBePD2XhE0iUqRsf/T6Ri9g
         g0N9U+HWxnbBRyhp5vad4bS2djG6LqaZKKbZ7rzKG/xGfGGQcE6rjC4qMEKjbowbOR
         mJxGaLZaMiL4n3Tbr9ApDpTvoSv59nP+xTfkLnxjZ9aiHSS82GZ83GsWYps+zz7kqL
         kRS5kCEKwmD3T5GPm5uaSiPYVkjUT2WSHyH//eRnpVwaDPqdlVv3kd/3/2cqEsCNsX
         c6NzaRhWFvrBR0mZnZIBq0t/8aRgMGf9UPxVN6UKjSOkyAo4pMjnb224IWIWcDW2Zz
         jMrQb11kZUL6Q==
Date:   Wed, 14 Jun 2023 10:39:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tao Lan <taolan@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c-hix5hd2:  Add I2C_M_STOP flag support for
 i2c-hix5hd2 driver.
Message-ID: <ZIl8zS5gvPs6Z8Dz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tao Lan <taolan@huawei.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220930014507.5612-1-taolan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cziHvEchWZRvbyks"
Content-Disposition: inline
In-Reply-To: <20220930014507.5612-1-taolan@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cziHvEchWZRvbyks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 01:45:07AM +0000, Tao Lan wrote:
> From: taolan <taolan@huawei.com>
>=20
> For compatibility, some devices need to work with controller between
> messages using a stop.
>=20
> Signed-off-by: taolan <taolan@huawei.com>

Applied to for-next, thanks!


--cziHvEchWZRvbyks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfM0ACgkQFA3kzBSg
KbbUSw/6AvkFQAKwhEMnyDexeBvkIfek/yJeqFpKp3IV0g7QpFM7BgkqgH9PmJBf
4/aeEarV67gh37Tq8PL/3c9FBwWXAt7XxDz/NLTlYdt9/sR9IVK1LMwW7vW3BpdG
mQXLOg4bDWOC9ATldmZJyVm+7+c8vp4hkH2WdizqT49YOZAqWrvv4YUP64LfNJYw
JQUuBhU2YWTy34p2J+tmcWnwtZtSKJH3UH6fWgj+pJnWL1oAYhFDhnQTXETeinZn
C8POqh1Y2lv9x7X3M9dyqR/JbA2JMNJcnBmp/2P2iU3esyDIYyNuRrnGHkMHR24L
PWIgqwnbauM8zEHX7dDX+keUCobh4kY73HnsGJLMA8bSpme+MzXazUcgXY+GZWI7
Hjl+bmI2ZdbiCwdoS8KyQ47tPDFf9pxmBJOeMQGtDG63k0o+9N6jeXQTRZ42s64J
sVdF1k/PByRBWH+Wr/qVVDNBdArJNbbTuIkkg4+Saea+RKyAIL038ak7faw84dN+
MpqOUvsk/RNVWXCXWriSA9YstD5n62anpx+8HMXw0gPNRThXm1K2iY+rBrbZH+P+
bM4JOSGc0TZBoOBXi8cybrUt2F/2dP12b1005lmqnkljjnBipvBhD02KqJVHawwm
4s+iLnrxsCeyyxZ3kaEHW2oXqGlnHSWyA1IgluAh18r4Q4IdSWc=
=Mv7P
-----END PGP SIGNATURE-----

--cziHvEchWZRvbyks--
