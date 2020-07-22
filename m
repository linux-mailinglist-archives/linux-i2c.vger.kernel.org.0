Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1652122971E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 13:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGVLGL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 07:06:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:57976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVLGK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 07:06:10 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E50EA206F5;
        Wed, 22 Jul 2020 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595415970;
        bh=ARlS4N0DZhXw5wn7LbL38sX1R2IWMLKLACGk0leo0Dk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SW3tnXE0YH4u8/RbLrHGYITRjEP2OvjI8Y6r+CECWSsE2frVy6FA99gpHQWH8Pnly
         qFBt3bFGb0YqyP/6REGRAhYKRQYAIIGSsoGtSvfAAZl7aE1ymEpns2yL+lZ79QGRz8
         tMyuekCdaBCqC5YSNBCFWMTp6nhDTAIux7ty3m2U=
Date:   Wed, 22 Jul 2020 13:06:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Saheed Bolarinwa <refactormyself@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, helgaas@kernel.org,
        bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-pci@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH 14/35] i2c/busses: Change PCIBIOS_SUCCESSFUL to 0
Message-ID: <20200722110607.GQ1030@ninjato>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-15-refactormyself@gmail.com>
 <20200717165820.6b5318ad@endymion>
 <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gblAvmLjk8yGG9If"
Content-Disposition: inline
In-Reply-To: <44eecce1-7c2d-32c8-865e-e80aa6c3a891@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gblAvmLjk8yGG9If
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sorry about that, lessons learnt.

I'll mark the I2C patches as RFC for me. If you resend them, please
mention if I should pick them or if the series shall go in via some
other tree.


--gblAvmLjk8yGG9If
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YHZ8ACgkQFA3kzBSg
KbaHQA//aXOYFUQm5LQqx3QQs6hscikHJBSVB6obrf87sSLtvV5ouvLY8TGCee6u
cDiLMk+rsy1MEMmnzVCViiRNNn1D0idIGW/FIVvoOx5SPtX8xWr9N1Z8OnXj5IAc
ktdKdMcuOIiDMMbkqyD7PoOweQcaS1bm34KmBvQvWE8fBmjhi19V9zgbhAYSLfw3
/NqpkSIbiLa0sll/mY594RFUtPE+Xx4ruQO/P1z7PqmZ3wg6VAO+vFGYFznIombR
fD9EpfRP5T2M4IeyRoQ/svX18l7/5gnIF/oebMZ7VMe6JJB3PldttuwyPprNw9G7
6oOEz7eJpEEzdGTUpLeZg/bkyrMuq+w0x1kmS5mK8yN6ifJr+LoJxobZnkbK8ML4
nxen3vRmHdG3NDlpiRuTXWj66ynk1Q8MtfXh1juEX3i3xmEdLMYensQtoQKaFQTo
nb3N6PfrgPkVy5OyF0jt5OvBkQJKzqMH2PaTO+8gIg4+Io2fBLSRIKz5EgF3Dqp8
KlmF5sH+Z3PqKtrAavMakYO/0ouzWAbzM7JC8O3B/i+BD444F+i2Hw3fuFpTR0Yw
Wm+iDrUJoKdgyOSUBFASM9bmmvOM0zakfzPCQPFuVEDJAMz2YCvdknaOMDW8Twy9
zZfEblQF9CrzE7wglCe9k+o9BOSKcJ7NnW4Ppp7TqOLiA2Z1q5c=
=uCs9
-----END PGP SIGNATURE-----

--gblAvmLjk8yGG9If--
