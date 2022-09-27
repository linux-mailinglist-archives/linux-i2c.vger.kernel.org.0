Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2925ECE9F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 22:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbiI0Ufk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 16:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiI0Ufd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 16:35:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC10E6E2DB
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 13:35:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C028AB81C16
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 20:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBD6C433D6;
        Tue, 27 Sep 2022 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664310927;
        bh=EzeL1u9Pe/X0064U03wS8jbFsj+Qf3wYc1jJIlXnMBI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=ax6SAwhvNy801+hcWXa34BP6tj8SzvwuPgC0WD/5oEnCoE68AinWcKCcXdWimP0pz
         SlSR1fS02cK6Jtz0gsTybsGJzzr907PjtbvuEw+n1VLR7edm3ce35vMhXkZjqogQPx
         Gut9AO7dcckNLwCHhQt5+6MZrPpAkdwERwv9zTCtQDGeSZKV16dswpnYJIasDv0e1x
         ixxZ+sFJMveT2wDwyI1g31lvLyW4sb7/AQFyiOgEpYmrlVhsxB44PD2PWXxE+366FD
         QZKjRWYXqyRu2xKiqt7pPGKKXZzt/N06cP2WlFvkwg1fMGBBT4i4CnUqUHJm6TfIaJ
         gOzo1Api5PrxQ==
Date:   Tue, 27 Sep 2022 22:35:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        git-dev@amd.com, Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Message-ID: <YzNei/DBUohqYlX1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git-dev@amd.com,
        Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
 <YzNdytanT3dO1eai@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TzZtEbLhR3omvutr"
Content-Disposition: inline
In-Reply-To: <YzNdytanT3dO1eai@shikoro>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TzZtEbLhR3omvutr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Applied to for-next, thanks!

Unrelated to this patch, but cppcheck found this issue:

drivers/i2c/busses/i2c-cadence.c:1038:33: warning: Condition 'actual_fscl>fscl' is always false [knownConditionTrueFalse]
  current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :
                                ^
drivers/i2c/busses/i2c-cadence.c:1035:19: note: Assuming that condition 'actual_fscl>fscl' is not redundant
  if (actual_fscl > fscl)
                  ^
drivers/i2c/busses/i2c-cadence.c:1038:33: note: Condition 'actual_fscl>fscl' is always false
  current_error = ((actual_fscl > fscl) ? (actual_fscl - fscl) :

I had a glimpse and I think the checker is correct...


--TzZtEbLhR3omvutr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzXosACgkQFA3kzBSg
KbYuFxAAmKY2W5I8h8qTZV67U/Kc6y0prB59fnOZT24+zRC49RkHik4jEKfbHqeU
4uaMud7O1GG3VeW7NLpq2cEoLTfQh+HxDJjs6XTu6BtRoVKkhDYUzaCWNTBk9XXT
1Dislx/bCkcjDkeQFAv5rbxqY2imgj63MrO0fMd0CB+uXpv3x/3Dwtx3G02b6hno
aNTs1Sx8bAjtafl9Dk+W4I3XK4Y9f81/8myOoh895t5YZ9OfNXLXCyWtG+ZFn5vM
awmeFhhFUwMsMvCBt2NMV/KBwWPzPw5esmwYquouxN6C2S7iDJ6de+FqVb5UgFM0
E3aVewQI7ig9GI5NSzUVOM6L0tXIBbxnoh7v9u1nxa6igDw5h/ZeJQe8Y659hHfb
h+Cm6bDsmCYRQvY57dXktXtr81IBgo5HGUKW/n5FlDIBbjr0m6D60cYQea+P+InT
uK3EOHaESbdMEwbJe7PNCi88Nua1eUZrEhwnlJa9/H79KJK6/7x+1gl9U3yfn68D
7fUwcU/8gmqQEuJvZtij0k4lXL8JAMcmicQmg0BzvTh48EInNA4tDx/OyX+I55QZ
eTljYk65Y5SqpF2ZaFuJZ10Q+HHiVO1PXOoefeF3AAR4doQUViAarLNEYbQoMG8G
WI946IkVfmtnChJQ/6sKi8t5xnNjX145pH6X0FDC0nETCucrCwU=
=f6BY
-----END PGP SIGNATURE-----

--TzZtEbLhR3omvutr--
