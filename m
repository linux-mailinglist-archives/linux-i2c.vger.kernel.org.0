Return-Path: <linux-i2c+bounces-12608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC2B4346C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 09:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26BB53A8454
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 07:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D6A2BD015;
	Thu,  4 Sep 2025 07:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/LkFyzu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBB629DB6A;
	Thu,  4 Sep 2025 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971821; cv=none; b=Unds5MjXWrjGpg1RccKUYilF/JEES+2vvRXRhArV0ttz00c6nvd50KuTX7ptzqYlSZHWoNP7FBBj5RPaqTiDsuJQINconihFbX4MKGZ8VaUm0bs8+UtOzVjOWLp5ZsJ5YkQ3daeeW26sihzhBF5WIj+vgCRb+0vmvzP78RD2Hqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971821; c=relaxed/simple;
	bh=MQUy/5kwPhxwrpneE0J7WzbNFUSZsEuhXb7b/wWwcsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn4LHvZ+rWtwNRCOweHsw0Mw93oMEKHmfhhX+rHY0nH0I2nxUbqjeFsl6A0K3XfcVzWGMXQJloWhW3AHE+AdlogE3MnK9BbVWPsKEFfUGXpcnv9HrZkH1PGyTD3hQrrgO793KfAHE8wTJoSWvAn5h+Ue/PCrIUTDzUSku8jllu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/LkFyzu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756971820; x=1788507820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQUy/5kwPhxwrpneE0J7WzbNFUSZsEuhXb7b/wWwcsw=;
  b=K/LkFyzu0VYB1yxBQPgeUyPoDUzLvxWTbcEZUufjQGmtYbF/EUTdk3yY
   VtYTltl5JRvNxMqX2H9aIz9NICjfMdKsMQExv4WGhblROM1LEEGZ7z/Bp
   cCP0WVSvMyqqV0fd7cJGkQJmaj9aYMGwEHYdjnTUmbJwpBkxehIFFF6Iy
   G6VpQmcS0e9jRrBH1o/fQWPRn+sUgLSlzhjMpMGZ1nmQ/rWetj/Slkwsl
   3+w3VQXHOw34bvDymzRuHMNab4j0Ynfx2/X7xBO3zIXar9jEXqOSkrEHQ
   9RAIL+/IpSdvxkn94CP+XroaJe7dZWtibW670bEfTugilFq4mWSyv6XHR
   A==;
X-CSE-ConnectionGUID: l1v1xOCGRT69T5Eo/JwZxA==
X-CSE-MsgGUID: wf7H9QcpTVi4EJY7dbWjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59447611"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="59447611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 00:43:38 -0700
X-CSE-ConnectionGUID: MDqRiLCcRImrFS4/8bEl2A==
X-CSE-MsgGUID: I62CBDfrR0KfoqwB1KiLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171073969"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 00:43:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D38CB11FCC7;
	Thu, 04 Sep 2025 10:43:32 +0300 (EEST)
Date: Thu, 4 Sep 2025 10:43:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLlDJETaWTjiSP0L@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>

Hi Danilo,

On Thu, Sep 04, 2025 at 09:03:44AM +0200, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 7:56 AM CEST, Sakari Ailus wrote:
> > Hi Danilo,
> >
> > On Wed, Sep 03, 2025 at 07:22:29PM +0200, Danilo Krummrich wrote:
> >> (Cc: Javier)
> >> 
> >> On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
> >> > Do we really need the available variant?
> >> >
> >> > Please see
> >> > <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.localdomain/>.
> >> >
> >> > I'll post a patch to remove fwnode_get_next_available_child_node(), too.
> >> 
> >> Either I'm missing something substantial or the link does indeed not provide an
> >> obvious justification of why you want to send a patch to remove
> >> fwnode_get_next_available_child_node().
> >> 
> >> Do you mean to say that all fwnode backends always return true for
> >> device_is_available() and hence the fwnode API should not make this distinction?
> >> 
> >> I.e. are you referring to the fact that of_fwnode_get_next_child_node() always
> >> calls of_get_next_available_child() and swnode has no device_is_available()
> >> callback and hence is always available? What about ACPI?
> >
> > On ACPI there's no such concept on ACPI data nodes so all data nodes are
> > considered to be available. So effectively the fwnode_*available*() is
> > always the same as the variant without _available().
> 
> What about acpi_fwnode_device_is_available()? Is it guaranteed to always
> evaluate to true?

acpi_fwnode_device_is_available() is different as it works on ACPI device
nodes having availability information.

> 
> If so, to you plan to remove device_is_available() from struct
> fwnode_operations and fixup all users of fwnode_get_next_available_child_node()
> and fwnode_for_each_available_child_node() as well?

The device_is_available() callback needs to stay; it has valid uses
elsewhere.

Technically it is possible that fwnode_*child_node() functions could return
device nodes that aren't available, but it is unlikely any caller would
want to enumerate device nodes this way. Even so, I think it'd be the best
to add an explicit availability check on ACPI side as well so only
available nodes would be returned.

The fact that none of the drivers using the two available variants acting
on child nodes had ACPI ID table suggests that the use of the variants was
motivated solely to use a function named similarly to the OF version.

-- 
Kind regards,

Sakari Ailus

