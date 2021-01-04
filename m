Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2372E9F1D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 21:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbhADU67 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 15:58:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:37148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbhADU67 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 15:58:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE5C020776;
        Mon,  4 Jan 2021 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609793898;
        bh=rripTFNyW3VaYVp3Y8MDcqMe6Ie2kproK4WF45PJ+4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJKhiK9+tFzJMm2kqMFeYWb26UeMDIc+iJiKl7qZXymkkv77ZNi1mAXD6zZPRWedd
         sthQ2beSx68Q0ZH7GwX9cWE/nJn01EY58rdY/lugXsiyPC4X2h6t6GwGWH2plisOYi
         plHinXNjCts+vYdIQk7QAOoPNZte23vdJAk09y2j2KC0jnMBF6JdtBAs2TyYXXoVzU
         gGjgAJCF7vCsEknyIYtjhSW9wLp4/k3peFt5rHz1UrY3fVVx1b37mex8TmHrFdKLwe
         SN2NaMaHmHH1BXstCmLpQR2jvg7DA2UdpHdhKfliaQ6atnJIsnUkVPxYjs3L1yAPwG
         t3Dw398hpUT2g==
Date:   Mon, 4 Jan 2021 21:58:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     bugzilla-daemon@bugzilla.kernel.org, jdelvare@suse.de,
        benjamin.tissoires@redhat.com, rui.zhang@intel.com,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Bug 202453] TRACE irq/18-i801_smb Tainted when enabled
 threadirqs in kernel commandline.
Message-ID: <20210104205815.GA10328@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        bugzilla-daemon@bugzilla.kernel.org, jdelvare@suse.de,
        benjamin.tissoires@redhat.com, rui.zhang@intel.com,
        tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <bug-202453-19117@https.bugzilla.kernel.org/>
 <bug-202453-19117-0k1QQBMPTi@https.bugzilla.kernel.org/>
 <20201204201930.vtvitsq6xcftjj3o@spock.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20201204201930.vtvitsq6xcftjj3o@spock.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Jean, Wolfram, Benjamin, or someone else, could you please check Thomas'
> questions above and let us know what you think?

Sending this message here again because Bugzilla didn't know about the
mailing lists. Sorry for the noise!

===

Okay, here is some context about HostNotify. It is a rarely used SMBus
extension which allows clients to send a notification to the host. The
host must be able to listen to the I2C address 0x08. The only host
controller which has implemented this natively is the i801 because the
hardware sets a bit when this happened. (Sidenote, the only clients I am
aware of which send notifications are some touchscreen controllers.)
This is why the i801 driver calls i2c_handle_smbus_host_notify()
directly. And only that one, so far.

But recently, Alain Volmat got the idea that we can use the generic
slave framework to make host controllers listen on address 0x08 and
check for a valid HostNotification. This is why the generic
i2c_slave_host_notify_cb() calls i2c_handle_smbus_host_notify(), too.
This allows all I2C host controllers which select I2C_SLAVE to use
HostNotify. Those are few currently, but their number is steadily
increasing.

And as it looks to me, currently all drivers selecting I2C_SLAVE check
their interrupts which handle the slave state (i.e. managing I2C address
0x08) in a non-threaded context. But there is no guarantee for that.
Unless we formulate one. However, my gut feeling is that option #3 might
be not so much churn for this case, but I need to double check if I am
overlooking something.

Given that only some touchscreen controllers send HostNotify and you
need to enforce threaded irqs for this WARN, this might explain why it
went unnoticed for 10 years.

I hope this helps. Thank you everyone for the input provided so far!


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zgWMACgkQFA3kzBSg
KbbHXQ//RFAcUW5RK7i/luC/jUas52ktWPd734DzP+JcdZ4xhKun/a9hI4cgEOkV
fT3eR1JafTkpI/ZyAFYX46qTuv6IDQLpeXxt/2FOpWMwd1R8vvtTuPHsw/T+7InG
Np+COEbGc9QqlqWj8foYoAH9AiozOzmzxergTH1nYUIsZwiicq5aNLWFoq8zMuDM
54aaBbI1xE84HmOk+PGahKjfMAdeY+DdDocvpaOwf4TcACnGlS8nn17pGuSFZGCm
K73VMKBLWYeRBaFIFIQqgF66Nyh6Bv0Hbo1YlOQHLjLLHyU7mNgWG5YOwmep30uC
f9jNQ7u1eBJxyFo9eCxy7KC9wPOd1mue/r3MPLxAxk7xoTw7mKh0FM4X0uktAhhU
CZ7QqvuePHJS3a1AvLkrvTuvIl4N123zUJZ+GqKMRfWmVaWBqKWCZIrBg4wMNrxd
wO6QwVChAmtEBUoCh2a72EztPL6diTjoxYQUCjxjcsa3mSrCbUtVv7pS7oHOBxOZ
AYz16wqZOt9Xu6yo85u5nvlMZAvN2d++foHitiawAWJBooFP15FJvrl9Hn+tTqpj
FDXsOcwzBB5CrwzYuMsED1cW2wGMfWC/gayLASLbMyWTks7QGvqjNcW5K/HovLLr
uUGmagIjWFJImpCi6PFx31G6I/84c7c+A8LS/ZV3ArH/77oKQpU=
=L6g/
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
