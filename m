Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88847D8787
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 19:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjJZR0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 13:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjJZR0R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 13:26:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3453590
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 10:26:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C034C433C8;
        Thu, 26 Oct 2023 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698341175;
        bh=V/ulC58a5LfJVX5wavisSwumWcJwtbXrRUJsg5+bfNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=afLXuJoSGhBj7fHwWoalKeo/DjEUbaQrbtz5NrFt9haLw9eKZ1VH8bie1taFLGoud
         Zznmvx9IWRrc0EedjfQiZvk9dHqtKZhNp81arczbQxG3vCv2L76TjnRUEOoofp5ET3
         i/VHE5b/pi4X0P/LnWFqzUV35Zu5vW9VAMfiM8jECXPC/XaTDee6KnAowYPvO7kS3T
         OByO1x2f88e5mzWSkgwAquBV+cxKGzL9zeWzEJ95mJhnC5nKzgMPYWT7GU6T+1w3R7
         nGw4RM+XIp689pSqFFaZcUv11/+rMERXE8dmvtX99bluXMOLpzrA2BHdGCt+3aS4AC
         s1Babz4GYp4KQ==
Date:   Thu, 26 Oct 2023 19:26:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
Message-ID: <ZTqhNCNCtUk+mz1n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <20231024173338.haei2py7izlqxjmw@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t+ij7JVM6oQTTOMi"
Content-Disposition: inline
In-Reply-To: <20231024173338.haei2py7izlqxjmw@zenone.zhora.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t+ij7JVM6oQTTOMi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, can we take this in i2c? Otherwise this will take two
> release rounds to get in.

In general, I can, no problem. But there is still on-going discussion
regarding patch 2. So, I will wait for a conclusion there. I am not
familiar enough with ACPI to have an own opinion about that topic.


--t+ij7JVM6oQTTOMi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU6oTQACgkQFA3kzBSg
Kbal+w//REmKZnyzryb0YPyt3Xa/LtVjSLhm/i28zSYJpqmn7ZmMLvQd+FdincA/
JeqBruTNQ5Gs7WoIJDyALMn//dv8G7YCHJ5aSmj5PpAZvJFezLAC2pqMoC8iD6Yi
j2OtMS6Zc+V0mlImPojTWNV+6RBOEcKhy42MN2pYFCvjWvTrjX5Ds8yvdQ6MBXmP
aiYJD7ppj5/EZefvNjFGhYAA+YPqN/1Xsd2FmkrJK03HLIk43XlFtnBvSnZUeD6c
/h0lcr8khDDO7VFFL/2/QcS8MvP0Rwnq1JzA85sxF25zP2Kevlp+zL6OsmjHP+3s
LVjFhQGQLL619NpPJdOszEin2hilEs6mD0cnK6mCbbUEyg87PyZSNeCz3zbVNIXg
8Ka+0jA0w2wuNquHopJ10DD62b3JbxqLSXeEnmWXdLTzn7OMvapcBaAWOzc0Hgar
5ryM74qVYUDZSugyNw6hk3tGbuh0kAGp68UPOpn7W9whBg/ojkFVbZk81sSmhjr4
MLEvnhjr66TiyDDZch5kE7NJ7zPzKGaW68zGgRsmWO2j98XPBK5qgCpDJPztb3jP
KybD7F3Al9hNaGrolD1R9TIXZ2tQM0x3GmNu7FFtskvAUbKmGe599ch21b/+GP9X
rw8gX1QfoGA41JSAd0dEQWHOezOMhZk/IUEj4cJUnuB5tCVGyd8=
=8d1G
-----END PGP SIGNATURE-----

--t+ij7JVM6oQTTOMi--
