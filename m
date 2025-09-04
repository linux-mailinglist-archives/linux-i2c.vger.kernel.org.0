Return-Path: <linux-i2c+bounces-12610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C533EB43647
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A45816C501
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 08:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D502C376B;
	Thu,  4 Sep 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN2kFZOM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1992264B1;
	Thu,  4 Sep 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975880; cv=none; b=fSMZ5cDHUmKXTf6GILur4zsFV9jgo569RctIbtYvozdp65O1Zybjgt7NIZqztkzX6YG7mJatFOpWubbIHxpRBY2vifHYtEWySpGY55vWHZGmYlwxWkLarO2KjVDja2JiFQ+8r/XvcySQxmE9hQoVKfzlVW0K/FFqd+jLEN7LsTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975880; c=relaxed/simple;
	bh=PQ+4876oOXTcBYbq5bbLoCjRmC8bWyaKpjk4sRZttUg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fCIK1TNruSS3L12jMj4IeCswRRli6dtssTEft1WjVqhSy01xpgk2LbSD3HI/qZ9RLp/xlj/oY8US5A8S6IFFJU2AneHDuZxVXTWDgW3GJ9iB2moBlZ45WJfbCqviZjNNDYSLLuc4mJiejV0uBpL6cm8PUhe+7/mLJii38nVimiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN2kFZOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED8BC4CEF1;
	Thu,  4 Sep 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756975879;
	bh=PQ+4876oOXTcBYbq5bbLoCjRmC8bWyaKpjk4sRZttUg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IN2kFZOMaNxCYS2JbmOzXeMKh2bJWPcUgI4zQKqOPDCyU9Q9QA7qvcdj0ZHL/QONK
	 sXgv0/xfyNghYGq5L+FfFaPmB/DOUxZodFp99va39BldCKERIZFshn72l5U+p8Ucy1
	 8WeZTnKqtGvyjVVNwuMeC+R3SLUb66hwOWCWrwgYorCknxTd4B4zW4vFBEex922vr2
	 lvJjzC7zFCW0R4YjHhCVHNRlaJfDlJfX2HDMztbS65R9yAUO/NCoANC1DEuQpt+kqb
	 WCS6CtFfPtFDTSJ06vIDSFscZD7zsfhAMxuK5P3onxR9MSyxobVeQldyegu3jJ5rXk
	 4DkdGXWUU39nQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 10:51:15 +0200
Message-Id: <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
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
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
 <aLlDJETaWTjiSP0L@kekkonen.localdomain>
In-Reply-To: <aLlDJETaWTjiSP0L@kekkonen.localdomain>

On Thu Sep 4, 2025 at 9:43 AM CEST, Sakari Ailus wrote:
> Hi Danilo,
>
> On Thu, Sep 04, 2025 at 09:03:44AM +0200, Danilo Krummrich wrote:
>> On Thu Sep 4, 2025 at 7:56 AM CEST, Sakari Ailus wrote:
>> > Hi Danilo,
>> >
>> > On Wed, Sep 03, 2025 at 07:22:29PM +0200, Danilo Krummrich wrote:
>> >> (Cc: Javier)
>> >>=20
>> >> On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
>> >> > Do we really need the available variant?
>> >> >
>> >> > Please see
>> >> > <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.l=
ocaldomain/>.
>> >> >
>> >> > I'll post a patch to remove fwnode_get_next_available_child_node(),=
 too.
>> >>=20
>> >> Either I'm missing something substantial or the link does indeed not =
provide an
>> >> obvious justification of why you want to send a patch to remove
>> >> fwnode_get_next_available_child_node().
>> >>=20
>> >> Do you mean to say that all fwnode backends always return true for
>> >> device_is_available() and hence the fwnode API should not make this d=
istinction?
>> >>=20
>> >> I.e. are you referring to the fact that of_fwnode_get_next_child_node=
() always
>> >> calls of_get_next_available_child() and swnode has no device_is_avail=
able()
>> >> callback and hence is always available? What about ACPI?
>> >
>> > On ACPI there's no such concept on ACPI data nodes so all data nodes a=
re
>> > considered to be available. So effectively the fwnode_*available*() is
>> > always the same as the variant without _available().
>>=20
>> What about acpi_fwnode_device_is_available()? Is it guaranteed to always
>> evaluate to true?
>
> acpi_fwnode_device_is_available() is different as it works on ACPI device
> nodes having availability information.

Well, it works on both data and device nodes, so considering data nodes onl=
y
isn't enough, no?

So, we can't just say fwnode_get_next_available_child_node() and
fwnode_get_next_child_node() can be used interchangeably.

>> If so, to you plan to remove device_is_available() from struct
>> fwnode_operations and fixup all users of fwnode_get_next_available_child=
_node()
>> and fwnode_for_each_available_child_node() as well?
>
> The device_is_available() callback needs to stay; it has valid uses
> elsewhere.
>
> Technically it is possible that fwnode_*child_node() functions could retu=
rn
> device nodes that aren't available, but it is unlikely any caller would
> want to enumerate device nodes this way. Even so, I think it'd be the bes=
t
> to add an explicit availability check on ACPI side as well so only
> available nodes would be returned.

Fair enough, but that's an entirely different rationale than the one you ga=
ve
above. I.e. "all iterators should only ever provide available ones" vs. the
"they're all available anyways" argument above.

(Quote: "So effectively the fwnode_*available*() is always the same as the
 variant without _available().")

I see quite some drivers using fwnode_for_each_child_node() without any
availability check. However, they may just rely on implementation details, =
such
as knowing it's an OF node or ACPI data node, etc.

So, before you remove fwnode_get_next_available_child_node(), do you plan t=
o
change the semantics of the get_next_child_node() callback accordingly,
including adding the availability check on the ACPI side?

How do we ensure there are no existing drivers relying on iterating also
unavailble nodes? Above you say it's unlikely anyone actually wants this, b=
ut
are we sure?

