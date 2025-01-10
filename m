Return-Path: <linux-i2c+bounces-9023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1CA08FA3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 12:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3723A61D3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BD720C003;
	Fri, 10 Jan 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFq6y1TN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D6B20B213;
	Fri, 10 Jan 2025 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736509509; cv=none; b=APn3cleh391EMh79vBfLcrP71aQPBsJfmOarrv9k3zP+ZR7JhVltQ51ZCfV1i9/9UVmsWrj7979lLwtHH12LYuA1Y1bJ+K1kOqhXuxi8IHc6l8mgozuCeaLvdThguYsKNgNF0TGj4c5wmAmWQiqatex3dnIH2YdPJh22o9/1cXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736509509; c=relaxed/simple;
	bh=byqcHQOcKktF4VooNl7RPzNym4ZcQ2c1h5XLoSPbArY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkslDKmdfsACUEdWjPGxbIFtMV7flyrDoKTxERRAU0AxPvdRGU7lk2WBxT1v7M4P5E6WWkM063c1ZGGr3o2K9bCyp6h5rRqsfOcjKSbVdVjT34qzB5gLWvMGWIQg4G+3lp2ABHYrKsg3bbXuv4mbIlB5EHNQu0q4N3cU4NLzdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFq6y1TN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736509508; x=1768045508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=byqcHQOcKktF4VooNl7RPzNym4ZcQ2c1h5XLoSPbArY=;
  b=IFq6y1TNSlTiOFCTG/8RKiJuw66SWnULGKgZ8GMO/Uyv9UGnguvV32sk
   Nug4Zacx1LJ7/Ezra5oZmSBKsUTn0pyWGW2IPoKB6LQHBKcU7bVXY9sus
   F+iw6sgcNjq/vjs8snXVd3RV6wCcBRUMSluKOTWLUEwFuY86z5C7dKmuu
   t6V1KKhSCB881v+BbW7Pf0HyIjY6VBgJfKNQBSKe0Q5XADD09EVw9C8gQ
   X3jk2uR8e0uRjrds8tqrdszZDrUHIdec3GNkBE1gY7sbCIw2sC/CWxufR
   Pm60vOVcBWztDDYvW2rnXRxF3znmDRbXdLvClOSQB/D3FFmzHtkM+NdsC
   Q==;
X-CSE-ConnectionGUID: tmaT6kGzRYOvZU2cO3WSBw==
X-CSE-MsgGUID: TogGyIAvTP6hNnJmMtmq1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47374875"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47374875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:45:07 -0800
X-CSE-ConnectionGUID: UN344reKTS2rq7xX3lzsTw==
X-CSE-MsgGUID: v1j8u9FMQ+OqpBIhDWp3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134614631"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 03:45:05 -0800
Message-ID: <0151b609-98d9-402a-b553-c9af5b0eb51f@linux.intel.com>
Date: Fri, 10 Jan 2025 13:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 R Ha <rha051117@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 linux-acpi@vger.kernel.org, trivial@kernel.org
References: <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
 <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
 <20250109111910.GD3713119@black.fi.intel.com>
 <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>
 <20250110112623.GF3713119@black.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250110112623.GF3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 1:26 PM, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Jan 10, 2025 at 02:31:26AM -0600, R Ha wrote:
>> Hi,
>>
>> Sounds like a good idea. I'm a little worried I'm missing something,
>> so I think being able to check my earlier answers will help as well.
>> I'm sending the entire output as attachments, but let me know if it's
>> better to upload them somewhere and paste the link instead. Some of
>> the ssdt* files are missing, but they're empty files so Gmail won't
>> let me attach them.
> 
> Thanks for sharing! Okay checked now dsdt.dsl (the other files are not
> relevant here) and what I can tell the device is supposed to be run at 400
> kHz. I suspect this is what Windows is doing as well, there is nothing that
> indicates otherwise.
> 
> And since this is a standard I2C HID device it should just work (as it does
> not require any vendor specific driver even in Windows).
> 
> Only thing I can think of that affects this is the LCNT/HCNT and SDA hold
> values of the I2C designware controller (and maybe the input clock) but
> there is nothing in the ACPI tables that set these so it could be that the
> Windows driver uses different values for those and that explains why it
> works better there.
> 
> @Jarkko, do you have any input here? If we cannot figure a better way then
> I don't see other option than to add this quirk.

Unfortunately I don't have idea.

