Return-Path: <linux-i2c+bounces-12582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E870B4211C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 15:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869A57C0185
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0223081D6;
	Wed,  3 Sep 2025 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlOWOD1d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF2307AFC;
	Wed,  3 Sep 2025 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905521; cv=none; b=HOJgOQVg8j65YcI4rnoKssuuqvvo4dmxQKr4eOj+LAJHTiDuZ2Yh1GZwCrEUIr949QyohKbDLnxh70uloF4uLvdid0eTJR3fnR/8tdnaLvDSHpV0IY+K6ZFtFH9/1SloUM7VHqV/KS1YXvtpdoNxkQvTtMUV1bMk+rKbRqybF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905521; c=relaxed/simple;
	bh=1S4qX/+e3SXArFFE1tFuKWGZfj0u0hqXDZMOLb+5n+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYMfcMIxBz0TWh0bhDfXMuZXWdrktVkSMUVsgWqXs02wYv/sCszUPOfAh+t3tfd+teROxk6Rt0KIU04vcwYv6P+RU5Xxxd3MnVwAzR7KzM9xbgt9kNIuJ8FDCtJMB6mbVUmJkey7Bn5nNylovVmYNFzht1Uv/xtRgOQ25PjeKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlOWOD1d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756905520; x=1788441520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1S4qX/+e3SXArFFE1tFuKWGZfj0u0hqXDZMOLb+5n+0=;
  b=IlOWOD1dYLoKFg9GM1cHDpHy0P/mAcIS3R1FfNp4Y0HcPcLEB7jHIbCm
   kw5ra1FyD94VS0uDtu12ZEMkhrUqdn4cg2svAhDOLTBVA3SQ6FbN4acU0
   j5WaCHikckZrerzYUkERPh4MSoDZulk1fDPuPsXXUSC7shcey5r7BMW0i
   JW6acZ68Ftul2Be9m070W8OKF+4MfwZgyc4fVB7tSFPjO8GgpIiZk5ukI
   vHNwYDRhV2q3NdVuUT77oz+rTs5cjZvFCUBCEeV0/+kkI5fne29PEbX0Y
   RjjxYjST8nt+216q+fEF5Vuacqa6cNuwjBSk46iMiaJzOrnhNtdcjHFb3
   g==;
X-CSE-ConnectionGUID: bIMBD2LIQW619yGymAOdMw==
X-CSE-MsgGUID: hpmVPlwTRpiEFTo1OgQhaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58250466"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="58250466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:18:39 -0700
X-CSE-ConnectionGUID: 4foyRKwxQzqxeSt79IFurQ==
X-CSE-MsgGUID: sHmdu4w5SiyF91QZOzpzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="202468602"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:18:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F149411F99F;
	Wed, 03 Sep 2025 16:18:32 +0300 (EEST)
Date: Wed, 3 Sep 2025 16:18:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902190443.3252-2-jefflessard3@gmail.com>

Hi Jean-François,

On Tue, Sep 02, 2025 at 03:04:39PM -0400, Jean-François Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
> 
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
> 
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
> 
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a
> safer and more convenient interface for drivers iterating over firmware
> node children.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---
> 
> Notes:
>     checkpatch reports false positives that are intentionally ignored:
>     MACRO_ARG_REUSE, MACRO_ARG_PRECEDENCE
>     This is a standard iterator pattern following kernel conventions.
> 
>  include/linux/property.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 82f0cb3ab..862e20813 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -176,6 +176,16 @@ struct fwnode_handle *fwnode_get_next_available_child_node(
>  	for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
>  	     child = fwnode_get_next_available_child_node(fwnode, child))
>  
> +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> +		fwnode_get_next_child_node(fwnode, NULL);		\
> +	     child; child = fwnode_get_next_child_node(fwnode, child))
> +
> +#define fwnode_for_each_available_child_node_scoped(fwnode, child)	\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> +		fwnode_get_next_available_child_node(fwnode, NULL);	\
> +	     child; child = fwnode_get_next_available_child_node(fwnode, child))
> +

Do we really need the available variant?

Please see
<URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.localdomain/>.

I'll post a patch to remove fwnode_get_next_available_child_node(), too.

>  struct fwnode_handle *device_get_next_child_node(const struct device *dev,
>  						 struct fwnode_handle *child);
>  

-- 
Kind regards,

Sakari Ailus

