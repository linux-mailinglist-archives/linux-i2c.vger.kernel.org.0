Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A5B42AB16
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 19:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhJLRsr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 13:48:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhJLRsr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Oct 2021 13:48:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4AA5610E8;
        Tue, 12 Oct 2021 17:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634060805;
        bh=SX30PB/37UEj9DmN7hV9YAGVbYiavCZLJBE9PCjMqSs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=VMKrPC9dh0bBS+06VUqPX61SBc98Mk8aBw85mQM8cHulrjXBQ7NMCu0Skj1mx8Xn/
         nl6bUPbZd0ijiZvG4wkm7A3m6v8WKIk4fhBMiLouomNKQPiF/Q77Ns7MgjOU07wP/N
         Ni3Xr3HeuJPs30wlu6gUAzTsz3Gk9izxlHFfkpx7jRfEByGA0e5/JOy6df26GXftF8
         s0astotFqaKDAjx4JvYEkCAIfkZSDtt9K3KbFlDeK7yFqajs+/X4UG7Ox6lyNS5jhM
         ia7hBBqRdsAX8/mMGYRVygxUVpVQO4XJBZil/1mygKxGoDQeYt0/KrkludPCvOliC4
         quvUrg2PsJAkg==
Message-ID: <4e0b7850e901864632c22551ecd7f137530c9770.camel@kernel.org>
Subject: Re: [PATCH 13/13] tpm: st33zp24: Make st33zp24_remove() return void
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Peter Huewe <peterhuewe@gmx.de>, linux-spi@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-integrity@vger.kernel.org
Date:   Tue, 12 Oct 2021 20:46:42 +0300
In-Reply-To: <20211012174052.iekzt22ojilca5lc@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
         <20211011132754.2479853-14-u.kleine-koenig@pengutronix.de>
         <4c6974280020118735644679f8498fe86748e648.camel@kernel.org>
         <20211012174052.iekzt22ojilca5lc@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2021-10-12 at 19:40 +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Oct 12, 2021 at 07:47:22PM +0300, Jarkko Sakkinen wrote:
> > On Mon, 2021-10-11 at 15:27 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Up to now st33zp24_remove() returns zero unconditionally. Make it ret=
urn
> > > void instead which makes it easier to see in the callers that there i=
s
> > > no error to handle.
> >=20
> > So, void is not a return value.
>=20
> Hmm, would you be more happy with "Make it return no value"? I think
> this is less understandable than "Make it return void". Do you have a
> constructive suggestion how to formulate.

I think it is semantically more correct to say that it does not return
any value, given that it does not do that :-) You can just state e.g.
"Make st33zp24_remove() a void function.", it is semantically sound and
not really that confusing.

/Jarkko

