Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0037153942B
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 17:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345663AbiEaPlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 11:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbiEaPlN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 11:41:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D44C8D693;
        Tue, 31 May 2022 08:41:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 173D3B8121B;
        Tue, 31 May 2022 15:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AB8C385A9;
        Tue, 31 May 2022 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654011669;
        bh=xXpbhpbfZ8kiZjZmE9KLcjjyjFNVnBip9la8DxLREX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DmyVHe+FWZ7CbCWTUHKtH1ut+HeK7SF8l2SP8OcjfvRP0Dt9y6p7C0hSSgLoMM7Sm
         fv8UkaFAZv3Q6X/mb6gA/MbHRN6HofKeU7qjAcC5B+tI1KWRxmvrWpNrIpAaKam7tz
         3iPZrkwIB/MvJAA8GuhXVx58xM47tU18ufa/pZrvaRrp9n+b60Jkw2Qx72esN8gzTO
         SGUZXiVWJhJNC7esKsJ6WzwBHo74h1TFOity2aV+l7RN+yFRbsVVwCDU4XM3yz1fWU
         P8hT2q68vBVmKSPzYxPOZUTNV+F8z80NCx1gC56leSVb4AvKvJcFQbriDiBxD6Xf3+
         qFRpDXAH1+h5w==
Date:   Tue, 31 May 2022 17:41:06 +0200
From:   Mark Brown <broonie@kernel.org>
To:     Prasad Sodagudi <quic_psodagud@quicinc.com>
Cc:     linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        wsa@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Query] Looking for comments on CONFIG_SPI_SPIDEV and
 CONFIG_I2C_CHARDEV interfaces security
Message-ID: <YpY3Er7F6hdzTfH1@sirena.org.uk>
References: <78873437-3b35-0711-a1dc-219b9f316fac@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YHoP3FmRhuNJL2Hv"
Content-Disposition: inline
In-Reply-To: <78873437-3b35-0711-a1dc-219b9f316fac@quicinc.com>
X-Cookie: May your camel be as swift as the wind.
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YHoP3FmRhuNJL2Hv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2022 at 08:25:26AM -0700, Prasad Sodagudi wrote:

> I am working on an IoT solution and would like to understand security impact
> of these two CONFIG_SPI_SPIDEV and CONFIG_I2C_CHARDEV interfaces of Linux.
> If a driver is developed from userspace for  /dev/spiX.Y or /dev/i2c
> interfaces,  are there any security concerns ?

Well, you have to ensure that only userspace processes that you
want to have access to the spidev and I2C interfaces actually
have access to them which is something that could go wrong.  For
I2C you IIRC don't have a mechanism to partition devices between
different users since it all goes through /dev/i2c rather than
per device userspace devices.

> Userspace driver is to control external SPI slave on board. I heard that
> these interfaces allows access to any of these type of devices on board.
> How to avoid accessing any of these type of unwanted device access from
> userspace ?  Can Selinux or any mechanism control access to other these type
> of devices from user-space ?

You can use all the usual permission mechanisms to control access
to devices (probably using udev to set up permissions when things
are instantiated).  I'd expect this to include SELinux.

--YHoP3FmRhuNJL2Hv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWNw4ACgkQJNaLcl1U
h9DCyAf+Jh2xvUruhba7MBz1fZX7Nqn6iCd4Dg7CjoD/4qU8z2hzyC/TGopE9+xS
iliKnXtqDetY61SGAl0UyneFJ42uTbuu75PohuF1FRpoXbmg+QK/Si2Bx+xBRxWb
SI+/NHy9FdlXo0MnAw5arF1v11wp/cUidxIQNHibz+ykZfhYJbtdC62QTTmRIYPk
Jmfo074YTJa308/RjfYddqSeczvGl+/REjmfEK6775HzGbjR7Nk+gRaUyOAWyO0m
6aGsEiEvshqIwQ6BpGBDuW02rQy1r4VPo5Xg4JTuDnv6HYeKrayvS3jM9IR/1z/D
h+R7M1l/8s5UdMGXFTvEFGbpYDHOVA==
=tTGU
-----END PGP SIGNATURE-----

--YHoP3FmRhuNJL2Hv--
