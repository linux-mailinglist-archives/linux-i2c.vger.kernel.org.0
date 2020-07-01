Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD352106CB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 10:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgGAI5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 04:57:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:38622 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728932AbgGAI5Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 04:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Dqx96H9utXLfS6nvYduGLuFxcqla
        OU+DgKthl+SO1jo=; b=DcYmnTQcPSsI4KrnFUI2xukNRpk4iVVwOSnccCf2WMSl
        yLJMF49OgIwqZk1WjH5eBOtLn50KG2dPbkABxNz+9fXdOnqlal/+xnm6Uesoqljh
        Yw3gL+YimTYOEuD9qXSgQxhVTO7Ikz94a70AXZfYvkbanXPYF3rljwox+As+bD8=
Received: (qmail 477301 invoked from network); 1 Jul 2020 10:57:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 10:57:22 +0200
X-UD-Smtp-Session: l3s3148p1@TODpel2petkgAwDPXwRGALjtBlSZf+V/
Date:   Wed, 1 Jul 2020 10:57:22 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 0/1] i2c: add slave testunit driver
Message-ID: <20200701085722.GB2261@ninjato>
References: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
 <20200701083024.GA3457@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20200701083024.GA3457@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Very good idea to use a slave to send the Host-Notify command to the host
> for testing. Later on, for SMBus-Alert, a GPIO can be used to loop it back
> to the tested master to verify that SMBus-Alert is working fine.

Glad you like it! Yes, SMBusAlert is the next addition planned.

> What you implemented is the "remote" side which I understood is meant to
> replace a "real" device for those features which are not that common.

Correct.

> Shouldn't we also have the "master" side loopback test driver as well to
> work with this test slave driver ?

Yes, ultimately we want that. But for this first draft, I simply
triggered with 'i2cset' and checked debug prints plus debugfs for
desired outcome.

> For example for the Host-Notify that master side loopback test driver would
> perform the request_irq allowing it to be called back when the slave test
> driver sends the host-notify command.
> In case of SMBus-Alert, that would be implementing the .alert function that
> would be called when the SMBus-Alert is received ..

Exactly. I am simply focussed on the remote side for now because I am
curious if it works at all. And what other parts need fixing, e.g. the
I2C core patch I sent a few minutes ago.

> With that the whole loop can be automatically tested. This kind of stuff
> can of course be enhanced to a LOT of cases .... basically something similar
> to spi-loopback driver for example except that in case of i2c it needs 2
> I2C controllers instead of one for the SPI.

This is my ultimate goal, too: scriptable tests for I2C mastes. Basic
functionality can be tested with a simple device, say an EEPROM. But the
rare stuff needs something like this testunit.


--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78T/IACgkQFA3kzBSg
KbaT5g//ZB0SSc3btTcLjsXpSwCC7yRHKF5sqPcRUHWyRwALfDVxfs9RNgS4GFz/
wDIruwdw7nEY+hifcrX0AmS8wbu/ik1x6R602AVeBI8gZKJFGULRaKXqzkbkcIsg
raq0rrMZJr48XcMD6P1c+w1Fzluk8jg5j4gJeQOCferoYJhjPFdbfV12LxHIcaqj
gPWvE/hnWKJRXioG9TGbNkJnFG3bcCZPNaSjLOwlc7RYXWupXeZaC1uI7jU6TcWh
pQ88kZr9tJ8ihJ6zbH329RE6QgQPv+MLbyiS3wFUjN8xOnoi3t2Tcw4zZxhbCjDx
1V/rjDZmykWQy02ZtlrnrpH8KhKHl1V3Lxgryn9PGw4SMiIl+J+zCpQhpne+siwG
pgoTEhf0SLmXxxYKKD39l04DP3Rea2qiTGxDNJfpkZleW3bnHWKuWGiQ+dQtz5pC
zIgmZzGc1JR72bcrwNAQdnA2LJ8fTGlyHTUAQUnlyG1sBiA2cgXRxaDDokUuJ0dv
3MRO0AF1+nYQMFYYLZFLCUyd6IdbMJGmuNelGHgVoHHElfq9EaUhCZj4CnoTFhBg
O6NkLhne0ezoaXfqF8rNKSjbVLUttWhTa6nQIUxb+p54CPP5ubTl9cOJArZBRjLf
iPPnxEwhgPph2NEOm2Jg/FblPO3xh447UPvZzX+u+k4fCMcoy6w=
=pk52
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
