Return-Path: <linux-i2c+bounces-4653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5692818E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 07:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2C2284010
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 05:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868DA13C3F9;
	Fri,  5 Jul 2024 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="GELMxgwE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D05ECF;
	Fri,  5 Jul 2024 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158927; cv=none; b=hHqSqhq3KNrLQEbaGQ7dgVFA/IOtGPdQR7r664wZTuJ70eHIrfiZFhEmX+m0tSRmelYTWlz+OG+ZfkR8ezdJd3uHlMqGIK7Bl8LuEC5z4n6xa5a/pspctupo1y8Tr/dlg3erFPP/maxQ83CO5sFK+Hb18J5eFua5JScjCoazu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158927; c=relaxed/simple;
	bh=yBjUpiLHFhuvNCJwIz+g9sl6kQXM/SRhv0EaMyOZAls=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MmcEeX/c+daKRe4BHXuMca3axb38j0fMCCBEzOq5tmyfXJL5SiL94DotLrdOoUBdWoclP/deOcr3uZxs5WM2/La1kUlupmJzH1a4XHlWk72eMSwYVXKYYBSDo40RtZe3tp27prxjhPU+uBkUfK6cA31TAKvwTOaLJaVqStENO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=GELMxgwE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1720158922; bh=yBjUpiLHFhuvNCJwIz+g9sl6kQXM/SRhv0EaMyOZAls=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GELMxgwEA04D7EMaWgbLWJyHCcuwc5BCLb828QP1wsF7pQET8tjFF6o1JhzF3H0VM
	 bHRi+u5lrjCeXFc7U6NrLyzynx+IpJ8BucFcV289WZz8poWbhpMwPX4KJWZjWdR22E
	 mkicgdG1WJ1cIkHQonjKC+T7iCYBmTOiRASYYeaw=
Date: Fri, 5 Jul 2024 07:55:21 +0200 (GMT+02:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_?= <thomas@t-8ch.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>
In-Reply-To: <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net> <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net> <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
Subject: Re: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <7a70c707-6a57-4f0b-a068-7efefd679088@t-8ch.de>

Jul 4, 2024 23:57:36 Andi Shyti <andi.shyti@kernel.org>:

> Hi Thomas,
>
> On Thu, Jun 27, 2024 at 07:48:11PM GMT, Thomas Wei=C3=9Fschuh wrote:
>> If there are less than eight slots in total,
>> only probe those.
>> Now the code matches the comment "..., then limit slots to 8".
>>
>> Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on =
muxed segments")
>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> I don't see the need for the Fixes here... was there a bug that
> has been fixed?

More addresses are probed than are possible.
Which is a change from the old behavior and also
contradicts the comment.
IMO it's a bug. Probably not a big one and I'm not sure if user-observable.
Surely nothing for stable.

But I'm not hung up on it and will drop that tag in the next revision.

