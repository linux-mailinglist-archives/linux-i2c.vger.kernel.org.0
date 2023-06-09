Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9306D729EC4
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241682AbjFIPjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241781AbjFIPjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:39:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833113583
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 08:39:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 151A161269
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 15:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B0CC433D2;
        Fri,  9 Jun 2023 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686325152;
        bh=CDqM32vS9vBnA7uuLvrmjvPDaWXtVzh2P4bKe0z8XQg=;
        h=Date:From:To:Subject:From;
        b=omjnOZn+pVE29zZOrfb0ebUIZb+R/bd6AQnso4dTY3F2jQZL53VnKyU/YBZlJqaJq
         bGBZ+P4qeUrDfqXXEvK7t2Qw9v8SPAqCBidbT4WiTUncyVXpA6HfHUwx6gmKYy3AMK
         N/eClwiYa8cPX/yaMevSMK+JDqedDUFPzMl9Ghamk8LE6/EG+/wwA3DmPur8GJO9s+
         3MHrTNYqnwNSo5Ft3YQJh4za4Emmn3nptfPO2u69R4oAkXFrkju6WogO3rXBAUT8VX
         A5JSSOUIweA3NtZru6OMYXpqhePbl9CDCr395+ess7Phb0K1QvX32zDX51AblzO5l3
         cf9FhjRs5ieZw==
Date:   Fri, 9 Jun 2023 17:39:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>
Subject: i2c-aspeed needs review
Message-ID: <ZINHnTJxfh5JyCzQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hrCuY5xfEV0vpquU"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hrCuY5xfEV0vpquU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi i2c-aspeed maintainers and reviewers,

for this driver quite some patches have been piling up. See here:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=&submitter=&state=&q=aspeed&archive=&delegate=

or here for the text version:

*               992038  Needs Review / ACK i2c: aspeed: Fix an incorrect error log printing
*               1180846 Needs Review / ACK [i2c-next,1/2] dt-bindings: i2c: aspeed: add hardware timeout support
*               1180847 Needs Review / ACK [i2c-next,2/2] i2c: aspeed: add slave inactive timeout support
*               1383544 New          [v1] i2c: aspeed: add KUnit tests for clock parameters
*               1444025 Needs Review / ACK [v4,1/4] dt-bindings: i2c: aspeed: add transfer mode support
*               1444026 Needs Review / ACK [v4,2/4] ARM: dts: aspeed: modify I2C node to support buffer mode
*               1444028 Needs Review / ACK [v4,3/4] i2c: aspeed: add buffer mode transfer support
*               1444029 Needs Review / ACK [v4,4/4] i2c: aspeed: add DMA mode transfer support
*               1492613 Needs Review / ACK [v2,1/2] i2c: aspeed: Fix unhandled Tx done with NAK
*               1492614 Needs Review / ACK [v2,2/2] i2c: aspeed: Acknowledge Tx done with and without ACK irq late
*               1577430 New          drivers/i2c-aspeed: avoid invalid memory reference after timeout
*               1583322 New          [v2,3/4] i2c: aspeed: Allow 255 byte block transfers
*               1637273 Needs Review / ACK i2c: aspeed: Fix slave mode unexpected irq handler
*               1641594 New          [v4,1/2] aspeed: i2c: add clock duty cycle property
*               1788215 New          [RFC,v3,2/7] i2c: aspeed: Use platform_get_irq() instead of opencoding
*               1788216 New          [RFC,v3,3/7] i2c: aspeed: Don't report error when optional dt bus-frequency not supplied
*               1788217 New          [RFC,v3,4/7] i2c: aspeed: use a function pointer type def for clk_reg_val callback
*               1788218 New          [RFC,v3,5/7] i2c: aspeed: switch to generic fw properties.
*               1788219 New          [RFC,v3,6/7] i2c: aspeed: Set the fwnode for the adap->dev
*               1788220 New          [RFC,v3,7/7] HACK: i2c: aspeed: Comment clock out and make reset optional

Could you kindly have a look or tell me what the maintenance status of
this driver is?

Thanks and happy hacking,

   Wolfram


--hrCuY5xfEV0vpquU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDR50ACgkQFA3kzBSg
KbYMWw//RnFJvLsS5nkvpcgW/qbC6EpyKpxK7bxvt3LB+3ikyF2bR09JQsR7it+k
u32PaFBKp/yv8BJy66LZ3JOZYSN6HFXCfYCNORHHGw8aRdiTyczihG9Npw4T0Qf3
fmCUm2lQW9LRUDIl5Qe0niTuym5T0urTWoC7sqLFmPXAnylBJA1p5Q9h036qiz+g
YJumNoFM0iZcygA07tzWs+1KOS7zFZThPYoKlE5n7IlR3u0rjV+AYLNRoi33kV+J
5HLUNUx7t/7Mb4nkAnl3kw6vJN65xLqstKaVhmHJmJvenRMOMEicO4oBY6xY7QF8
We+IxG85uuNnW0mlpdC+R1z1gkjJr14iRKxXQzSAxLRSh9BXsoBmY7Hkmk5Hvhql
dI7rBSgI4NRdWOtcCZEPR8wFIYXPPUXMmQfJrZUu0gy/Fu3i3IsTUAkkIQOhBnex
SCQdVxNDlTRLWq2Kqoe7jKxBQC05/D+6dOnv+5Gk8SEaLW2whhegPxgSGjqraziZ
GKg0t2LN+a08nGCbJaXdWVleli/jKVqSgUVTP99Zd/ElTREVHjRP0EZgDIe5fE18
fctRNIpCQ50d36KrOScSPYXEF6rjLaUcG49z9AcRf5nofLJJWncAz5jJXxc1vCss
A3APs6XZhbSNwYsF5A/iLE5vZxx8q+1xyVNWHvdYYgaj9EoHRXI=
=0va6
-----END PGP SIGNATURE-----

--hrCuY5xfEV0vpquU--
