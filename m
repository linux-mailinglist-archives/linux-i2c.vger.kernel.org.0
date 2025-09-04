Return-Path: <linux-i2c+bounces-12606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AFB43343
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 09:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 974A0162521
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 07:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B5E2868AF;
	Thu,  4 Sep 2025 07:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds8OpRwO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407628642D;
	Thu,  4 Sep 2025 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756969428; cv=none; b=cx2nU69U66YmrKTZ1Vs+IiZpIXInOHKXHI9EQvVEnr85Qm3EXKF5RIcORI58TaElqtWB++Np7LHGZyifqMTmz2wV5upLyETqWnlkNo4MBU9ObHJamCoRjVSWrqpjQnZ79laWADxKaW/hLZZNXRRgzPKJOQsridp9/SZlDTUVQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756969428; c=relaxed/simple;
	bh=UN1zBMHZj+zqZW96zkOzVqEldbE0hEA82H0xM74o/rY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AE6ND8CuZodRH1pICrfkrqi1Bcoj/ZwOIFq1Saaw0d2rUSlypCt5CdLCf1rkkmpl6QPPt90BdO7fC1wCNGJvANzpuwrECv3hZl+0W69bVGP0HpDJdxNVQsbaDhqn6YSaE14LOmCb1unDFU0V4EA98GGHnVyNVmEOWPMnr4St9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ds8OpRwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED11C4CEF0;
	Thu,  4 Sep 2025 07:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756969428;
	bh=UN1zBMHZj+zqZW96zkOzVqEldbE0hEA82H0xM74o/rY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=ds8OpRwOm2nWJqHXA4sFLodcjwVGuD6u10uSMjj5wpxrP9RMmkTt0/l7331wfYTDc
	 b4UacHPUXwzautBlKnb+y/UNY90AbWGaKPkxQjUsAS70sFe5M5k0H3BrQIM637Apse
	 ytxpZ3nIWuKG06ejJ6ghWguzqxM9rZd/v2wL6VbGUGOIAfd6f/gxOJPOOf6yk65aGb
	 UTHq1l01gsmVZXAn/Gsi4RfP0/jmfyVmG6cZOewbWmDQy0Wnnqs4UujRKQlhDKoK8P
	 yBlmFGDCepK7jS8NhLh564mxC8n+4AX+7rykInH1f1CRGxgLVost9rxOoko9/ryh5I
	 /AoqJK8KBxXAw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 09:03:44 +0200
Message-Id: <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
Cc: =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
In-Reply-To: <aLkqE9c9w9m4Axsp@kekkonen.localdomain>

On Thu Sep 4, 2025 at 7:56 AM CEST, Sakari Ailus wrote:
> Hi Danilo,
>
> On Wed, Sep 03, 2025 at 07:22:29PM +0200, Danilo Krummrich wrote:
>> (Cc: Javier)
>>=20
>> On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
>> > Do we really need the available variant?
>> >
>> > Please see
>> > <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.loca=
ldomain/>.
>> >
>> > I'll post a patch to remove fwnode_get_next_available_child_node(), to=
o.
>>=20
>> Either I'm missing something substantial or the link does indeed not pro=
vide an
>> obvious justification of why you want to send a patch to remove
>> fwnode_get_next_available_child_node().
>>=20
>> Do you mean to say that all fwnode backends always return true for
>> device_is_available() and hence the fwnode API should not make this dist=
inction?
>>=20
>> I.e. are you referring to the fact that of_fwnode_get_next_child_node() =
always
>> calls of_get_next_available_child() and swnode has no device_is_availabl=
e()
>> callback and hence is always available? What about ACPI?
>
> On ACPI there's no such concept on ACPI data nodes so all data nodes are
> considered to be available. So effectively the fwnode_*available*() is
> always the same as the variant without _available().

What about acpi_fwnode_device_is_available()? Is it guaranteed to always
evaluate to true?

If so, to you plan to remove device_is_available() from struct
fwnode_operations and fixup all users of fwnode_get_next_available_child_no=
de()
and fwnode_for_each_available_child_node() as well?

