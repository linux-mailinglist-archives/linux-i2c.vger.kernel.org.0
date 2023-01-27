Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6614C67DE54
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 08:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbjA0HO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 02:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjA0HOy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 02:14:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F3430B17;
        Thu, 26 Jan 2023 23:14:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 890E961989;
        Fri, 27 Jan 2023 07:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B0FC433EF;
        Fri, 27 Jan 2023 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674803693;
        bh=x1JdooluUWCGUd/cgPpH9376iPbKL4rLMM3SWvULdkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=alVnaxqmsTkMn4vrUIwoH539/du6MCVRTulUgf4bAHidBbrFckuxGBDFnEEylSY1R
         EnnTgXvEfzUK497x5CNoNxc3KsAc8ls1P4fTgI6yuQ9YUk217w0l+fV9NQqNNQ2HEx
         pT/OO8+l4oYD+16/mPGPTzA3U+8Huqr2ch6xqzPgF/SfqNKjsgPbjUs9GWnYjhudUD
         Gq+9VHi0tDoNymTJHRH1DqGq3vXj7Wb9geSg+AwnycXknIblvUhWe2PTAhg7PLbzZ5
         k7eJyrmwgUQO4HY3IN9MpXkZTUJBHSk38q98Oic9XVxh7O3pNQ2CRLYv51Rc8BkkEw
         4P95UPS2GMjRQ==
Date:   Fri, 27 Jan 2023 08:14:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/35] Documentation: i2c: correct spelling
Message-ID: <Y9N55pFZc6TRD9S2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20230127064005.1558-1-rdunlap@infradead.org>
 <20230127064005.1558-12-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kx4chLeJ7UNCk7qz"
Content-Disposition: inline
In-Reply-To: <20230127064005.1558-12-rdunlap@infradead.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kx4chLeJ7UNCk7qz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -  client->irq assigned to a Host Notify IRQ if noone else specified an other.
> +  client->irq assigned to a Host Notify IRQ if no one else specified an other.

I am not a native speaker, but shouldn't the last word be "another"?


--Kx4chLeJ7UNCk7qz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPTeeIACgkQFA3kzBSg
KbbfPQ/+JqbYfo5oC0hH8L4kQfxU84K8CYhwHmda2e694LyreyIgSxRq5vwaP4MA
5tNnlPcu/1B9j19U8BLotJFGEXmMvQTfOQnWClSSRQ0bvHsX44XwpnPzwGchstGX
uI58n6byEoE5OtEVl0/9x0oO7hpGsDhlWlYKTolgEXf7O0Gt1gFGf2dWdddr9mPe
xQD0UvP8MNfRNUNyYCKxRe5FnIYyvXfIVqEwiLY8pUzhPEK4nRkvkISHEjt5/y0/
+Rlyue//arueGgOQ/cmBum4kVgr8brJwx5DcGt7oGdxJEG44SVWsyfr4+8b1t6bH
Y34HWyS4lOlUG/1CyS58ay0/CA5BNl52iKKiWCX7z26TboNNIKj3nocaAOFuX9OB
eNyLMbQcioovQ4L3o+j8cuow9Q0+0wjuogZ9JJ3jZkqQkE/XLyCU/+Li66aixmXE
H8vGsZA4sjhDCBHSmrqhRmpiWmqp5+AarGVpl0JM+V+P6U+CG6r4GDufb6Gse2Gm
7Bm3K/gKG3zmW4KNyfkyd2vFTS1qGVWg2nk1YEyIvK8Rkw9jwXApv7OQbKD5lgRA
1/kCRGBcw5hwcq1FfwJkGgR9BviAXYxH5bQY9zYPtAdzwWzDoG7EywaxcvkBFvr2
0WSXfC+qEauHnXE+IAPltHgC5XVopHTFQ2rdI5mqfveuSw0tS8Q=
=noBS
-----END PGP SIGNATURE-----

--Kx4chLeJ7UNCk7qz--
