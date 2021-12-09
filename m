Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694B146E55A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhLIJUY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:20:24 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47070 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhLIJUX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:20:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8208B82361
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 09:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B3DC004DD;
        Thu,  9 Dec 2021 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041408;
        bh=oQ1LO+gJyWs07bzN3jHMPgl9aO2ebi4Co8QNMQFTMM4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MW98sGiZkdlvL3cCAiHH9b4m+UTgs3mhzH8xuDur0Ujzq0aj38SIPw6kxHbgJsul6
         g64kXbuiTDjjZChbNS07l+0VzYSndAv0sKS0uo3lphhJeIbrtnozWqkLn5GsJvx86X
         u7nu6VdTM74vVZOoiL1w4ZbyIoiiQoAZdyMKacOMV9AX38D0O1EbEjKQYNd9TedB95
         q81KAUnzwScxc7qSwAEOJgh63VtMI4FDnBsuRxsafLI3qCl/d65zNtyCxPDSKQBlGt
         6u07kupbRF0wm6Z3t1AFkF8FsLRqYvIGxgSU3LlI1v3igL4JmABpVOFQ62BBjZJvvf
         0qLEJaqzsij/Q==
Date:   Thu, 9 Dec 2021 10:16:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Message-ID: <YbHJfUk14INERHEB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
 <20211203105914.393ffd24@endymion>
 <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
 <20211207151443.362c89a2@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BuwVSj6tGYflnjfS"
Content-Disposition: inline
In-Reply-To: <20211207151443.362c89a2@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BuwVSj6tGYflnjfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As I got some time to think about it, answering myself: I'm fine
> removing the checks. If we ever hit the problem (unable to clear the
> error flags), it means that something went wrong _before_, and we must
> have logged these problems already. As a matter of fact, that was
> exactly the situation for Felix, the message you want to remove was the
> 4th error message logged, so in fact it did not really add any value.

May I read this as an ack?


--BuwVSj6tGYflnjfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyXoACgkQFA3kzBSg
KbZHxA/3a5gAo3MvtFFycCETV38vPgjRYaPMh4N4F44s3f2MAwaVRMaGMLkSk6YO
bUsHd+TozcklEKToczhLTLlgc3vyd3dR+GJNgBWUrfqJCCEgUkPr4UQK9dQxlUSD
qBGKWH8RzOTZP4hrl/HVKXlyAIkduAgKC6deqDkt5sME+PV4ZZf5GirQxhDTy90u
btllaVPQ9RJjcGubl8AMr4MRFK2yNThL+vfwfbLvU0RurmQ5FlB4GrAUP2ZPcb5J
KAx5waofjS8mwkvkaG9BAqXwL1bc+N9Jj05ZSPIzvw5Q++ZNmiuFM/6Nz1M6BwjN
TNpb+ak+jEC98RuD05YMGKLyMN1cTDbnu6AsZ4P4k+NiebjI7jp3RjfpQXVljseF
uD21ZyrDR3mW/BhETcyNwaSEfUzr7y1ziEJlI4cT/FZ3DfeAb6IJx1ZbKEDkPLyZ
/k29EFyXsH+xZpKv6FAHodnqBF7E3oFL9sRPSpQ4efc69YCF6WjO/FQjcZJVPCgW
+0rlO/ApXbPjLVmorzn1l0ZaI0dlt0KZh7NtR1qpxA69cyjT3fhTwv3FjcbX/5KR
aDzFkeulTnzA4Z9z8H+9DI+Y5zVfYuycu1+55nClcPc+AfbwpRJ5EsPh8wUe2akY
Im3u9rZdiAimjlcbpKZJFZia7cDolxue+0VyqSTI8htNxyc3KA==
=QeFB
-----END PGP SIGNATURE-----

--BuwVSj6tGYflnjfS--
