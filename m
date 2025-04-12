Return-Path: <linux-i2c+bounces-10283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C7A86F2A
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 21:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964DD17A7B1
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 19:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA40221702;
	Sat, 12 Apr 2025 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RI1TYn+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1078347A2;
	Sat, 12 Apr 2025 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744486684; cv=none; b=bfDA2RP1SD5SdH/gLQ6mSf0zOuuHDLJPoNfCbH1GSlxP235hrkQyCwzHp6AE64kJ7mUJPaeazeCJnuiRqwBA29kKFtARuBebfQGC5FA2fvmRctZ5rbZyJ6qwQbUZep+KY4lDHeP4A/O/C2kUKWtVr1Wgxa9Rh7RaHDp/CFpollw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744486684; c=relaxed/simple;
	bh=LJCFpsFQXxV7XF0xum99HfeRIFAkwD6OjlY8P039gfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sX741s4KPB4QiaySkvl9Gea/1VKZQK4uHKEJi3pJ8TsuUZntYYFNW8v4FApswYwc2SBvm2TIgHt+sKEEAqEs8vPkYph0RBBZJTqNKhKGhGgqzPYGwnLMkUjX5p98kLTdMlDreamBbN/RNQLP7/1ruEkGXp7ylrETkyW3wBQlUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RI1TYn+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331DFC4CEE3;
	Sat, 12 Apr 2025 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744486683;
	bh=LJCFpsFQXxV7XF0xum99HfeRIFAkwD6OjlY8P039gfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RI1TYn+zd5OoqKvj/us7SntPdaiHW6KPFQaBjYOMdVYkn9E+266jLUwnfTlsr1h0s
	 AanF+lfFLGHmGKVBtGrxiYI6m7Q0B5Jb030s4SFCNmUoVuiaym96FZQw6YdfbG2FPh
	 t9vNjJlZCpLu0wh7/tFc4xL11Fcz2N+/dgtaw0WxQj5FNM1BoD+2jBwhf6ZB0U3rUk
	 7nmxuMJ9PFcxKnA1+aayUoPGHeZ0CsVzf+++YQ9lQVBuvCu2xj0qewWTataJHxHY6o
	 qo/QQ4TnLb8wJaSEuGSrdkbq8KBouxfDKywDNYmXd1Cbr/XZT8zcN+tLpFy3nYaY0A
	 AYR4BbwaY9VAQ==
Date: Sat, 12 Apr 2025 21:37:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_rBFMp34zIYkRwh@gmail.com>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-5-superm1@kernel.org>
 <20250411120617.GMZ_kFucLFQQ7LJkys@fat_crate.local>
 <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> 
> 
> On 4/11/25 07:06, Borislav Petkov wrote:
> > On Thu, Apr 10, 2025 at 03:02:02PM -0500, Mario Limonciello wrote:
> > > +static __init int print_s5_reset_status_mmio(void)
> > > +{
> > > +	void __iomem *addr;
> > > +	unsigned long value;
> > > +	int bit = -1;
> > > +
> > > +	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> > > +		return 0;
> > > +
> > > +	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
> > > +	if (!addr)
> > > +		return 0;
> > 
> > newline.
> > 
> > > +	value = ioread32(addr);
> > > +	iounmap(addr);
> > > +
> > > +	do {
> > > +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
> > > +	} while (!s5_reset_reason_txt[bit]);
> > 
> > What's the idea here? The highest bit is the most fitting one?
> > 
> > So why don't you do fls() or so?
> 
> The idea was to walk all the bits and pick the first one that has a string
> associated with it.  I was finding that sometimes the reserved bits are set
> which would get you a NULL pointer deref.

Would it be possible for firmware to set multiple bits with a text 
behind it?

BTW:

+       [32] = "unknown",

but BITS_PER_LONG is 64 on x86-64, not 32. How is that supposed to 
work?

Anyway, in terms of robustness, it would be best to assume nothing 
about the structure of the bitmask, and do something straightforward 
like this:

	unsigned long value;
	int nr_reasons = 0;
	int bit = -1;

	...

	/* Iterate on each bit in the 'value' mask: */

	for (;;) {
		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);

		/* Reached the end of the word, no more bits: */
		if (bit >= BITS_PER_LONG) {
			if (!nr_reasons)
				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
			break;
		}

		nr_reasons++;
		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
			value, s5_reset_reason_txt[bit]);
	}

which prints out multiple bits as well, and does the right thing if no 
bit is found, without having to encode BITS_PER_LONG in the 
s5_reset_reason_txt[] array.

And BTW: thanks for implementing this. :-)

Thanks,

	Ingo

