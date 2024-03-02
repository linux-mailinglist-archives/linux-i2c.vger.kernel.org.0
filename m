Return-Path: <linux-i2c+bounces-2112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97F86F032
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 12:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0214E1F22223
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 11:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C08B15EA2;
	Sat,  2 Mar 2024 11:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlvcIkoe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599114284;
	Sat,  2 Mar 2024 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709378369; cv=none; b=JPZgOIn3Qd7JQEGr7Xt0QoDDMhhnK4fpsPkt4U0Tegn1w1AW8aFY+M3gwARag8yfzKHzHxhYlk/PR1zNcdQD7867C4XfZ39vPLwuFSIDJ/qVYmCrCXHYe7DnPvAHemIz1FTiznuatwgdTTnJwE8KNjeB7ALGMPh93QvZXhytdeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709378369; c=relaxed/simple;
	bh=RIN0m/WaaUlLrFwRJY7PXrBAT7et+Qb+p4ts+i9/cEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmcRkJIjdqQ5BkAAmPDA9AbLwh6uoOwjF2rx/DmRdMExLaGWoEVYSWifyoMKcPP/Zq7Iww57zryo67xskYQ8vhT0Ayzrp4ZIfobzEK0YhQw3U8IVm7rQ3TuvvaZOWea7CUKI8FW/KsCTmQXUl4lcU7z16L0CAwof3fBy2ZBw+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlvcIkoe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8630FC433C7;
	Sat,  2 Mar 2024 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709378368;
	bh=RIN0m/WaaUlLrFwRJY7PXrBAT7et+Qb+p4ts+i9/cEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlvcIkoey4waWmNtG3fR+8TM4eLQoaVdcc9IaLGyVJUFBeGnq7/3C99Rt9fLHhORa
	 L3T+Dbgs7EmFImw4lOMTOSjXY7VgGZynEf9uyggMOOKzlqaNpYVFg8wH/iUub+x1Lc
	 MeBTqJc1fW8ebKnag94r1xuozY1TUXs7Q4jU7lvqO6M+fwp+hHRLdr+1uGx2bQfGZ2
	 T4nviKiAJKrLjtCgJ1KCuBtYMEWh/6REo4CHeR8okt+md48VeO3XodxzXulIHjKXRw
	 Vt4mhbZsLyBNadUc+NT0XBNJve5L1xdb1JN5IXvyAnCBLK8YEciEzkJUXNYhrpK7ts
	 OQUsIL/02vRGw==
Received: by pali.im (Postfix)
	id 9065095D; Sat,  2 Mar 2024 12:19:25 +0100 (CET)
Date: Sat, 2 Mar 2024 12:19:25 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240302111925.v5fpqsbdf2py4n6u@pali>
References: <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
 <20240227210429.l5o52wuexqqmrpol@pali>
 <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
 <20240227215000.gbmn4n2uzd3hyk3b@pali>
 <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
 <ef071afc-8768-4aab-aaee-4c3c3c317c0e@redhat.com>
 <20240229204612.3cmeqdjixmvif3yw@pali>
 <4892abd0-6523-4955-be5e-4e585a276297@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4892abd0-6523-4955-be5e-4e585a276297@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 02 March 2024 12:02:39 Hans de Goede wrote:
> But the point is that moving the code does not help because
> since there is a symbol used from the new code it will still
> get loaded on all machines were the i2c-i801.c driver gets
> loaded. So it will still be taking up RAM and increases
> boot time (loading an extra module consumes time) on machines
> which do not have any SMO88xx devices.
> 
> And that point is still valid even independent of the code
> is moved to the existing dell-smo8800 module or to a new
> dell-smo8800-plat module.

This is silly argument if you are opposing to adding trivial exported
function with input argument struct i2c_adapter *adapter and with body

    if (smo88xx_detected)
        i2c_new_client_device(adapter, &info);

with two static global variables:

    struct i2c_board_info info;
    bool smo88xx_detected;

will be compiled and loaded on all x86 machines and taking too much RAM.
Because that design with notifiers and other things would eat much more
RAM and would be also slower.

As I said in previous emails, detection (and so filling those two above
static global variables) can be filled in the __init section and so
would not take after bootup. For detection it is is needed to just call
dmi_match(), acpi_get_devices() and dmi_get_system_info() which can be
done in __init section. I do not see reason why not.

