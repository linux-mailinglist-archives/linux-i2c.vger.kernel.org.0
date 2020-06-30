Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F118820F7F5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 17:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389247AbgF3PL3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 11:11:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:47398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729051AbgF3PL3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 11:11:29 -0400
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CCD120720;
        Tue, 30 Jun 2020 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593529889;
        bh=Kof5P3F4RhHddyde/k6hvfouOCHADx+GYO+1CoM3OgM=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=wDcjG9Ffp2rf2uyADpUEj8oIWGdNSEHcfaFoqa6A2PydIwLazG4iE4vp2Dr3rz9HY
         lgsmGFRLso5cO8GTM1JLw/m5tCTB4+9iKbbfhPX7paqvUJBYp1aDsmOYduexVJd4XX
         WfNUaav0IfqFf3DoRSzEp6acRgJBg1ZWoLp4Ahao=
Date:   Tue, 30 Jun 2020 17:11:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 4/4] i2c: stm32f7: Add SMBus-specific protocols support
Message-ID: <20200630151115.GA1058@kunai>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
 <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
 <20200630064050.GA996@ninjato>
 <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alain,

> Ok, understood. Fine for me that way as well. I am just a little worrying that
> the "host-notify" can now be present in both controller AND slave nodes
> and might be a bit hard to understand. At the same time I don't have a better
> proposal for naming the binding for the controller.

It is a valid concern, maybe we could name the binding for the host
"enable-host-notify"?

> Please do not consider serie v2 I just posted few days ago and I will
> post a serie v3 updating the binding information and using the host-notify
> binding in the i2c-stm32f7 driver.

I also have an idea for the SMBusAlert topic, hopefully I can come up
with a summary later today.

All the best,

   Wolfram


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77Vg8ACgkQFA3kzBSg
KbY4ww//em/vnMiq7NS89p7OgWcLT8uZEKJWygqaUmVWOpwz0HD1JlDWg1fgYnCQ
cICy1tOydUEo+FXs/AZty5YQHRSghTEYrEA/SDdTfKDassc897O6K747UW9OYAYN
94ls0vDGfyW9+MmyPhLLHbocYfHpyPusZyueZvqH5ou5+1RlmyPvXgg9/Hh+SCYR
oY4JoZZ0u8k/WpZGhS4z4QQKXJ/h2220mEvLVxEwt/ZhQWXWGTHCc9T6yHmplXxR
SQu64RVtAz/JZfOQcG6JiBsX+ZD707n78SClOSszcGrKMfFBGdXJa1giQcFI9wEQ
ImA91dkgWhYWYaynOyn1wydKElDfHSIm4TSjDo5JtIGO5u/+CrnYzrSBsJ76lz3C
VQ9XrgyN2On4t+hKEJ044QKPJcoGUBnIUx8ERU9JbEIXHgHBmXNs0Vvt6gH0cBBu
hLMgnRWOUZdh382yowRY0cdq3gD4ePXiivAVLoDaQDDetk/eWX9GIZNPROU0rS6E
/F7W8yI3hohLmvDqA8AnHvEQR3wnNmmXBCJLV/sK3Q5FI8OEFxETwsumAziY4nHW
rujYZBZ7z+apz3Bxq08DUZxj9aIZ+o3SN39cW7j3pU4e47wnrpf4WRCAchwiVjvu
EkaGFUnE/oAmfrP2FzisenLvLUvyZ477TWrDVytEHbBzgWnfEsI=
=6INs
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
