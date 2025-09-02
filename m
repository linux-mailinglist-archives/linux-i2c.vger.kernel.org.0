Return-Path: <linux-i2c+bounces-12552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF1B3F3DC
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 06:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 854D07A8235
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 04:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6B62DECD3;
	Tue,  2 Sep 2025 04:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jo8zwzPN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA0235962;
	Tue,  2 Sep 2025 04:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788612; cv=none; b=XFd+DSy2jRWAyw7rff4nofebZg4Cf+Kssug8EjhqbkQehwWVvlj6utR+a6yu7pBUyyXhp4YQXH5BdT0gOzxOQoxFnd3yS+9cVWlB97/8g5mROgzs6atwlErZOXKxKyTvZQSsiPEcv86XgwhOJyXgFnZVjwXZdpTvc0FcYQHEP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788612; c=relaxed/simple;
	bh=KdiFK2Ork7cB/7cMeg2MKhqauepVuvl0glmbgl2tmd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVXUyRBzEPHsiqizmFLSHQSavdkvOU3J6LpOqLZxxOId7p2Z2GLMQw2lVnFYoDpB+m55JtdhWsCzPwnF77Q1phiFaStMFB/gWWwwJodwzHP638EXGbSsuKZ3Evm/osZh6JyR7kXZ/TCJoKYuy9wE+9zKtsxy4uWfMzPkr0wIcVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jo8zwzPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC4C4CEED;
	Tue,  2 Sep 2025 04:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756788611;
	bh=KdiFK2Ork7cB/7cMeg2MKhqauepVuvl0glmbgl2tmd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo8zwzPNbW5L0G145Y4mzNg/3Zg+f4NhaV2umMAj2Ql0l/3IMP/3oW0qHpBBBYbvx
	 2MK9poRRdfmnYcdMVxOkX+By2FV+zH8H42YhPk3kY5Frhe25cytmCCwgiBAH9G9u8p
	 +I14CysGpuYfkrB0/mCof1PVDC1GXGES8og9As/0=
Date: Tue, 2 Sep 2025 06:50:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <2025090203-epiphany-antsy-bf45@gregkh>
References: <20250901163648.82034-1-jefflessard3@gmail.com>
 <20250901163648.82034-2-jefflessard3@gmail.com>
 <9ed3743b-4f86-42d3-94e0-8a720526dce4@kernel.org>
 <85D46ECF-B4A6-4C78-A4DD-0785FE58B2A3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85D46ECF-B4A6-4C78-A4DD-0785FE58B2A3@gmail.com>

On Mon, Sep 01, 2025 at 02:16:35PM -0400, Jean-François Lessard wrote:
> Le 1 septembre 2025 13 h 48 min 14 s HAE, Danilo Krummrich <dakr@kernel.org> a écrit :
> >On 9/1/25 6:36 PM, Jean-François Lessard wrote:
> >> Add scoped versions of fwnode child node iterators that automatically
> >> handle reference counting cleanup using the __free() attribute:
> >> 
> >> - fwnode_for_each_child_node_scoped()
> >> - fwnode_for_each_named_child_node_scoped()
> >> - fwnode_for_each_available_child_node_scoped()
> >> 
> >> These macros follow the same pattern as existing scoped iterators in the
> >> kernel, ensuring fwnode references are automatically released when the
> >> iterator variable goes out of scope. This prevents resource leaks and
> >> eliminates the need for manual cleanup in error paths.
> >> 
> >> The implementation mirrors the non-scoped variants but uses
> >> __free(fwnode_handle) for automatic resource management, providing a
> >> safer and more convenient interface for drivers iterating over firmware
> >> node children.
> >> 
> >> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> >
> >Thanks for adding a user and splitting it up (Andy was a bit faster than me :).
> >
> 
> Very welcome! Thanks for reviewing.
> 
> >> diff --git a/include/linux/property.h b/include/linux/property.h
> >> index 82f0cb3ab..279c244db 100644
> >> --- a/include/linux/property.h
> >> +++ b/include/linux/property.h
> >> @@ -176,6 +176,20 @@ struct fwnode_handle *fwnode_get_next_available_child_node(
> >>   	for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
> >>   	     child = fwnode_get_next_available_child_node(fwnode, child))
> >>   +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
> >> +	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> >> +		fwnode_get_next_child_node(fwnode, NULL);		\
> >> +	     child; child = fwnode_get_next_child_node(fwnode, child))
> >> +
> >> +#define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
> >> +	fwnode_for_each_child_node_scoped(fwnode, child)		\
> >> +		for_each_if(fwnode_name_eq(child, name))
> >
> >IIRC, your first patch mentioned that your driver series would only use
> >fwnode_for_each_available_child_node_scoped().
> 
> You are correct. Next version of TM16XX driver patch series will use
> fwnode_for_each_available_child_node_scoped()
> 
> >
> >And this series adds a user for fwnode_for_each_child_node_scoped(); do you also have a user for fwnode_for_each_named_child_node_scoped()?
> 
> No, I haven't found an existing user that requires the scoped version. The only
> usage I found of the non-scoped fwnode_for_each_named_child_node() is in 
> drivers/base/property.c in fwnode_get_named_child_node_count(), which doesn't
> need to put the fwnode.
> 
> I included it for consistency since the header defines all three non-scoped
> variants, but I understand the "no dead code" policy concern.
> 
> Would you prefer I drop the fwnode_for_each_named_child_node_scoped() 
> variant and submit a v4 with only the two variants that have real users?

Yes please.

