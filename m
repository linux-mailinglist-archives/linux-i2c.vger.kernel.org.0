Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66A662678C
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 07:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbiKLG5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Nov 2022 01:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiKLG5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Nov 2022 01:57:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2632861BBD
        for <linux-i2c@vger.kernel.org>; Fri, 11 Nov 2022 22:57:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3E3E608D4
        for <linux-i2c@vger.kernel.org>; Sat, 12 Nov 2022 06:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBD6C433D6;
        Sat, 12 Nov 2022 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668236231;
        bh=fYjArv3AXmOJzoXIoiJSVNVbO/A/oiZhIcRNpp6BuQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aaE54yv2p2HspCeQJofs+9mZeaLfmNqN+NHN88mmhLQkWdPFlFdWrmQC455xU1f29
         9G4X2J7GRpYVz82iqaDix7QfDMhrnb/4gSNPT77Zd+s37ZqHiJtmceKEbJW5dmIo4f
         72b810oqNtuHvwkWr1J8OJfxGWDRTu97SEG5tpUxPdFBaCLb/Eb0HH9mOgNN/FesF1
         dB1f3A07eD2PL+1Qfqdm+U7nUNNoXDQtFmE+CycZqLgvLzrh8YzK+jPZsFFhhKby6B
         MxPx5TexCBrXHffyCAt8c4qBjoKvbobY5j7AIej0hn6ZWKPidtIF92PMPL0CCc/EHT
         Vtfd59SB/ea4w==
Date:   Sat, 12 Nov 2022 07:57:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
Subject: Re: [PATCH v3 02/12] i2c: designware: Empty receive FIFO in slave
 interrupt handler
Message-ID: <Y29DwdOd5UIzgwsl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Michael Wu <michael.wu@vatics.com>,
        Tian Ye <tianye@sugon.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
 <20221107134248.864890-3-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q1ParranMjOYB2V5"
Content-Disposition: inline
In-Reply-To: <20221107134248.864890-3-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q1ParranMjOYB2V5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 2. i2ctransfer -y 6 w9@0x65 0x00 0xff-

Always nice to see 'i2ctransfer' in action!

> While at it do not test the return code from i2c_slave_event() for the
> I2C_SLAVE_WRITE_RECEIVED since to my understanding this hardware cannot
> generate NACK to incoming bytes

Not even on the last byte? That would be bad. If a backend encounters a
problem, there is no way then to communicate that back to the
controller.


--Q1ParranMjOYB2V5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNvQ7wACgkQFA3kzBSg
KbZF5BAAonmyT4RS6dno9vCh7WFm8+S2Q7Qj84Nc6HMa+aX2fYeLfHOQUmkxenWu
UWGKSaoB7H+vFOddhI/ik8t+DleOqdHEkGrSc9yxaiGzgeKpexs54/2kWbiBO1QF
1KzntR/J32eTBdKwwzkXWmbgVC4eobGICDNL1mfjDj+AYeyOkcLB+MzVsDzW7cuv
X0qRdKUtQlSnYw32cDLPnXkZ5Q0z0vkaGMRsZO67rsyApN8zZF/xfwNMiI3A93Bz
CKzl75wbLoMm8fbU0MfacRqMwDd1CP5NRl5XAA67EeloNI3U0TAe5hhgTqLvTesZ
TJGNFRXrlf8Htkww3pnh0bv3uLlXtioaqFUSKGKfx5OfIkSkRTUi8cAKgWG7jBo3
avb4OdxL1FoHHSrgm+n3ZvnoShxP9fb5nPnmRI2edYd1+06+KVes9uVTspCZZxB1
1yTjmwYsacqWIiRGfjopszTmrqFYB1MAtfPliq8z5sVXgrb0uiDZmm5/tjiHq3NQ
SD+msnweYyf5ghs9vF8hH/hf1igqO0+wUnKeuzjrwUZmmaxUzQvZBbirTlJ0YI2h
m1eMvOoUZXXw9hD5vCISCyvDZ2WdNW+p/rzX3PFdtI8g7m47JcMvEZsjH1y6/4Cc
7tfFISEP0zrxlSh+Jj8kuEKUheE/JTLbptFRugsbcB6IrfNrIiU=
=ZJQN
-----END PGP SIGNATURE-----

--Q1ParranMjOYB2V5--
