Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233DB1B1728
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 22:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgDTUbt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 16:31:49 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38991 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725774AbgDTUbs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 16:31:48 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id B50805C0097;
        Mon, 20 Apr 2020 16:31:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 20 Apr 2020 16:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=JMLwYzWJFZJjSwbOPBsyhMipS7z
        6+ryERcPhvkMB9Yw=; b=VtGDLXJb3zfGugu1hjkG1Uax9FJD6+tV6sJNQjtMxjF
        HOSBLh0HJyvUEa8VtQc1ib9Duxm15hAKDn2q1G2GO7zeJBIytKM1VWIW1NOC264A
        7yGmwRct8dErhAv9q8sQ52OrjuKSNO3R/PtA7U1PmtSEL2Ki87GduIwpL+/lwwLN
        nmlLWERTkbbj5RAFYpJkOsjvVPVpk85gQmo1uj1Yg8Lph41YrQE+sSo/suzFSHMT
        2ApRTUJGI0TTr1xcHMShetYZ6puc7xEb+fQXp66Gi6F9k7qe086gP0xchTqylwzj
        YoRbhRysiYgqc764zTamJKAejyZ4nU4F5jHjcsarOTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JMLwYz
        WJFZJjSwbOPBsyhMipS7z6+ryERcPhvkMB9Yw=; b=J/4OyVfJIs1EyhQfQGUxNV
        RiWiBsaam5RBAvv126k7pvkPUho538rSR+TfyWU8qqvFmtVPvtu2BpA16dTDlQxi
        E3QuSYXh5l8i/sYqQltgGCayMuhbdz+UAYqneVpaUHpEiBguwpdrgWesrml/UPHl
        UrMxHiyptb4Mb+tJRw/mdc715p51EZC+r6fpTG017yoWc1DiLbT/xRRpjjKQmhED
        TU9hNsCCNfwkjJ7A7HRtYkggISe3+bmGWMWzYYE/tCPHPMSpggALwcEKOPoccGNv
        jsi480v8dQLymjSQtdeZtPFWAO3yzAegUeZm2pMvUbcnHMOidwG6KRDJPhI5ENYA
        ==
X-ME-Sender: <xms:swaeXiSDXj4RF1BzSD2hvHOXqTjRZHgAVzty9W8FiczINXtLcO3DDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecukfhppedutdejrddutdejrddukeejrdduuddtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihii
X-ME-Proxy: <xmx:swaeXjhkzpGWYRLhKQJx4pNf1xBQ5h5956vYRCFPOdHU6pN3FnNaxQ>
    <xmx:swaeXinN-BX8SvLIxpa9FKqj3PjXUnSFwwF7r4ucy3H_oohP-nwgrw>
    <xmx:swaeXkAv9IITqExCudv-Ql5jqyVLZGK-9oLIDHR67DA17T_32ksiHg>
    <xmx:swaeXlTd8NjnqiqK58apyvIHaWb9rSHpqPR0KrGFnriwJ45GCgH6rw>
Received: from localhost (mobile-107-107-187-110.mycingular.net [107.107.187.110])
        by mail.messagingengine.com (Postfix) with ESMTPA id 33D4E3065C1C;
        Mon, 20 Apr 2020 16:31:47 -0400 (EDT)
Date:   Mon, 20 Apr 2020 15:31:46 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bjorn Ardo <bjorn.ardo@axis.com>,
        Patrick Williams <alpawi@amazon.com>,
        =?iso-8859-1?Q?Bj=F6rn_Ard=F6?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <20200420164349.GD3721@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 06:43:49PM +0200, Wolfram Sang wrote:
> On Wed, Oct 02, 2019 at 08:20:53AM +0200, Bjorn Ardo wrote:
> > Hi,
> >=20
> >=20
> > I sent in another patch earlier that added support for specifying a fil=
e in
> > devicetree to initilize the eeprom from, corresponding to the case of
> > pre-flashed eeprom. Maybe these two patches should be merged so this
> > initialization is only done if no file is specified?
>=20
> Yes, I agree.
>=20

It looks like Bjorn's referenced patches are still unmerged also?

--=20
Patrick Williams

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6eBrIACgkQqwNHzC0A
wRlalw/9HeoJesi01g2+IOPj7CAKk3h/pTnXSyzqHMkYUgNaTdhy/U+VE9B7ZvJf
Hln/gHF0uLaXtTcfXq+ogjL+new9tnJJhQqBEvCAqJ3335agSco1/owDHTCrpKyW
y3IGmh4Yls68I5A3YL6OniwqtP7j6qwK7BffAfqGhXiG+5qwLm5hG2Cq1o+nMUm3
xN0y8EB7nmSVbNfUj10aUnXevop7x1pFILzkR299G8XNreI14egQj3TFkmGmRxob
Veogw78GcH9D6D334hm0e3lEWElUMGfleuqonRZQdsm0qaZU5veJSb6s/hAy0pW3
PNKufnYjIK2ZStlt6tcJxmsYE2Qc9uiYqFXP41DMAUCB1x5ATAwi82Gq2PDVO9XC
NbF8MpC0xHf039YcU7LneoN97ZawVamyEyuoA4JtIan5AwBNrLj4dOJfsfZzFz6l
Al9kVVhT4AiR7068nkEhLB1fTlQhSwrrrQhjd6A65nhbS3e3EjNKU53rriBw87KW
aOqAM9CykHKf0fZEIks5/yje3fJ9dTQQ+BgLLoAEqzJdkrGB/kuw8NGSgAnithun
Nsog+4pV2TkymhO9uwDmQmJAZkSIFWaZoOaYW20xauItZYA76o49tTGZnFhcWjg0
XI3dm8EFa4XZ+lRftlzu7LsmNbcJvcbiBqAJXeplrm3gDMumwwg=
=p8Hs
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
