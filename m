Return-Path: <linux-i2c+bounces-13965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3EC358FC
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A8C0343004
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A62309F1B;
	Wed,  5 Nov 2025 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Sw0hy9Gn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F02571D4
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762344504; cv=none; b=ArxX0ABu3JdDeh+99/j1+Mbyk+aMLeYtViP1NtKkSs+bhXAHJocmFsWTxzG1dPfM8eVcPc0bnqSZgkv6zUEiJUmmBxQk8EiFAzB52g3WSYAtGK/BDeSG/fijMkde9CbQbx4+VQZlI/sgE0DUnnyZQDafSU6N6HKqoNOcdHAjpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762344504; c=relaxed/simple;
	bh=CWaG7KzNqBOisghHqfZXO5UsM1sVGe0wnnAolR3xfQU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=a/WuSq/VPlyVRJ7YqqLq/xY8UI/J6Dqw1qeGrFfBdmK22S+UAoTT9umd2MirEDFw2V+Q+/aHXjYTzfk0sMVjkY+Hyo2EIYOxp6XLXvbChg9J+PLNNCTs3W0cUMPHB/T4ezUxZT/fKj3lXS1KlrEIgmqM6Er/TL1ADr/NWBsJuYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=Sw0hy9Gn; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id A3BA86063D;
	Wed,  5 Nov 2025 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762344493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWaG7KzNqBOisghHqfZXO5UsM1sVGe0wnnAolR3xfQU=;
	b=Sw0hy9GnUZWIUqpsmTkeh8AI27lUEPt0w/5Znx/WopK/ylizHlmWYw2kZIHIpmyzcIxpV3
	2PJwFiwm+wq8a8tmdEASbZ3xOsSQiKg0BN++tpSrngjSU3iuh20tQmNtFIhRRkMSzW4oQ/
	5+x5DeyDySOorh2AqvAt4yYQvfeRF5o=
Received: from ehlo.thunderbird.net (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id A28874003B;
	Wed,  5 Nov 2025 12:08:12 +0000 (UTC)
Date: Wed, 05 Nov 2025 13:08:12 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
Subject: =?US-ASCII?Q?Re=3A_i2c_issues_in_6=2E18_on_R4=2C_but_not_r?=
 =?US-ASCII?Q?4pro_=28both_mt7988_with_i2c-mux_on_i2c2=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aQs6O75BqOERMzPJ@ninjato>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de> <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro> <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro> <aQs6O75BqOERMzPJ@ninjato>
Message-ID: <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: f6e15a42-7f46-42a3-8df0-9f2dc5129f95

Am 5=2E November 2025 12:51:23 MEZ schrieb Wolfram Sang <wsa+renesas@sang-e=
ngineering=2Ecom>:
>
>> > Maybe this option should be enabled by default or when the i2c-mux is
>> > selected?
>>=20
>> That's what we were discussing=2E At least a warning will now get print=
ed
>> to the logs when booting suggesting the above solution=2E
>
>FYI, all the commits leading to this breakage are reverted now=2E Sorry
>for your troubles!

Why? My issue was solved by adding GPIO_RESET=2E=2E=2E So it was fault on =
my side,sorry for bothering=2E

@angelo
yes it is a final board BPI-R4 v1=2E1=2E

Why sometimes it works i guess it is because uboot may previously initiali=
ze the device (and without reset working it may be stuck in wrong state)=2E
I'm not sure if my current flashed version had the i2c and i2cmux support,=
but i got it working on that board because of the connected eeprom (read ma=
c address via tlv_eeprom as macs do not have fixed macs via efuse afaik)=2E

Thanks for help so far=2E

regards Frank

