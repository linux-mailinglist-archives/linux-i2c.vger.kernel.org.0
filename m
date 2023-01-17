Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5783E66DAEE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbjAQK0q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbjAQK0p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:26:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652306E90;
        Tue, 17 Jan 2023 02:26:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 154EDB81263;
        Tue, 17 Jan 2023 10:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56460C433D2;
        Tue, 17 Jan 2023 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673951201;
        bh=b3nK4kFIkeuzu66DlOX2cgMjXs0VXS2oIYg2wFA3m30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=brdWOuG0zyB1x1Xf4yET8rOQwP2kFCHpqP8FmiVVocu+rWLXZSEp1UcXc1tlQvWWL
         iC0MZcKkjwC9yzRuECgnn3/3QjTOfE/q647XeOMJdxlKBamTfTb+z/E4qBwNQtinbF
         AYZsGga41ixzDcGBQBC5a5VvTu9Fpjati59/hQrHmUi4TBxJW6NOZs2pJK76IkuZrZ
         nS/bMCrF1lgdiz5ybH6y2Ws1xTCaCkEXS72Zkb0lY8SWOsxdqsSu+AsrOk8sP+rQUT
         bmnFhEiNQ0wIfndhdLMhkInJOTGd5VyDeolKZAgHgHW9N1jL0/vJelTPlNjhI2xG7i
         FRK4RWNaVpl3A==
Date:   Tue, 17 Jan 2023 11:26:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y8Z33ml5u0GLMSIG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221229160045.535778-1-brgl@bgdev.pl>
 <20221229160045.535778-3-brgl@bgdev.pl>
 <Y8ZzkfYZgJ54XzdH@ninjato>
 <CACMJSev_hLAzaF2M15raxb49mkE7fFMN8T+BdT9-TYu2BJkasg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="//qEJWNh+7NkzxBA"
Content-Disposition: inline
In-Reply-To: <CACMJSev_hLAzaF2M15raxb49mkE7fFMN8T+BdT9-TYu2BJkasg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--//qEJWNh+7NkzxBA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No, not really. It can be logically split into two elements though:

Ok, no worries.

> removing the existing completion and then adding the locking bits
> which unfortunately go into many places. I tried to make the commit
> description as elaborate as possible but let me know if you have any
> specific questions.

Will do. The commit message _is_ nicely elaborate, still I need to dive
into the topic thoroughly. I'll let you know how it goes.


--//qEJWNh+7NkzxBA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPGd94ACgkQFA3kzBSg
KbZ8bA/+MQJa65dFS35N3+BwtZ1T3G4+plkSce4eYzzoZ92+dNM7h2x/QcfPUYkP
JlgSGVcl7htYQOtAG8yuheIYJaCbz09mID7Jsh8+ztpcDCQcBdse9zh/z6BQRa/b
azP4GMb6+ZS7LG/cS+DS239Lq/34fHvktIJ5d7Gc9osg2AnlRPu60dVlD9ZqZFj1
2vMgWGl5iEyahcojfn+7wJSt23jvTI3v6PS7poZWkAtDg7j5KKrwtzI1/Xlyhx7m
cg8GKzbNT/9RpcmggG6yuhpBk62N4FoDnXke7710eeneN0BbBbqQMRywnie2XBh5
MsLxJ8ghML6kN/XugBPzHob3eAsaBFHpyxDTFHiLUN88Aj2Yxgvt8z7DGVMG0q/2
1v36rZYB6JqFb1YZfuPFXKB5t3gW+ozSK5XRXNZ4jtzCEn8CHMbJOYb8xnpQOyNz
n1H4kG2XYyUpT3npfR3M3evThuCn8U1bErYS9Iq5C+3K3H7YTwjGAf0R/89Of6Dq
dj7dso38M22UcxEVrwtGY9Of2qI1J8kdxjycksp89TVLgO2NiaPDNAcaEdOYSvuZ
WslvYTr5WM6dLgG5fG1m14kxXpMvgioQCGTkKRm3ph/JPChE8GLwKSoyf7jrefTl
02/JCqa4IwA8I0RMoYD1T/lHQ1+r14fJ2Z+dvks5UMGyfdsBidk=
=dspZ
-----END PGP SIGNATURE-----

--//qEJWNh+7NkzxBA--
