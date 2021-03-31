Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8BE34FB3A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 10:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbhCaIHv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 04:07:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234422AbhCaIH1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 04:07:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E66CD619D6
        for <linux-i2c@vger.kernel.org>; Wed, 31 Mar 2021 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617178046;
        bh=rfHiwifaYK7JSg1hwNzrVpUSRSr15q8VBZZiTvGFUc0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=lXi3aVK1hm9usJNVw2q8tqaBK1Qofds7cOjltO+LBQ8BTz0/4CbxYoVfMyRTGoFZ+
         AzJDo1AcEDVadqsqz/bA6ROxjhixmPGDTG+lZFO87A4LFXL67i8IT0lMCEMJUQjqpk
         nExHz4DsObOU1Ei+ro5B0eHWt04wyaIRtnGkPShv7rrDG49QyoDt/LtWMIBWH5JMOW
         kdQglK4qLS+evwCKW8ciemhoe0KtxFGl4dwsnys/nvc4UaemclOwx8XKemCE2mZ3DY
         lvu3eWKQZn7sEdKja0yb3/by+BT5QQvTGCe6W9urdou6e1eisbMw6zMCh4raVhZ9Hh
         Y8xOOfuy4SU/g==
Date:   Wed, 31 Mar 2021 10:07:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: update email address in binding docs
Message-ID: <20210331080723.GK1025@ninjato>
References: <20210329192541.7451-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mZBmBd1ZkdwT1ny"
Content-Disposition: inline
In-Reply-To: <20210329192541.7451-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5mZBmBd1ZkdwT1ny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 29, 2021 at 09:25:41PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--5mZBmBd1ZkdwT1ny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkLbsACgkQFA3kzBSg
KbYL1w//TK6nsYcpUyjD2wrircOOMUpR9NeYajt2zj9VOykqyZkGbgAjBsG6iNyc
LkhSL1Vo8ePU4B5G/xKqEGPOYfXQSrU64Y3igLmgwbWq8BciaF3anG3y4y8OeKxk
AOLsmuSwaVU6tb94sM3ikyXnDOyMqG4vpM9XcdFLKrCsoPZUAohYPLT+CKJa7K+a
HEf5OhMKu0XP7FwtpOyzvA8CADOkovexgwenQV4V0OLvCYvnmQF3sF0SNWtHcDpm
zPYIRBUA7gDjzVwbr844gEf3ndXlDh8OEyCkRtHF4FXAgeUFHi7qFAgC7ct0ejtn
BjQruS3P+FvuEMaP3yAUrMa9RWBudQCNyykoAl0hZ/PswKcW1bZqUXpQYAwGMi5Y
ek9N7iWG6lLfYK+hQNVi4Y1KFBpuVYYFBM6v6VDlDAzyITpwIrSpp2LcyrBAQOra
UUhHyZ8qnADB8OuFeP6uOIF1JO9IpLdmT810/hLJJnANDCwnb8wyJmboFOfbfBie
thliQ57sb//xuJado+QSmDcjVqCGGsSUWnc5jmPAkswAKz8DDP1J60M9gGXxR3Ad
co4YnNlC+aB2t7mPTfCVZIS1ndw8tZRSpt3uqGzcEdbr8v8A+izwHP2my3vsPRhW
EahoyPPTp8lYlNQGn7ygITm/KNYbS9fq8QgMP2Z8z5gBmExenYI=
=ZVy5
-----END PGP SIGNATURE-----

--5mZBmBd1ZkdwT1ny--
