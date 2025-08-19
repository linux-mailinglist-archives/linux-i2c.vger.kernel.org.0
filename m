Return-Path: <linux-i2c+bounces-12339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C481B2C91D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 18:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7995C0242
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68BE2C235B;
	Tue, 19 Aug 2025 16:09:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A52C2348;
	Tue, 19 Aug 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619780; cv=none; b=YnJqjZqKDEir61onttW+kFXZJ/6/AhbJq60lO71SGp/kSubFpWwdESJmkhmVRpIHqLK4GJitbVrE4GrfKI7CenbiEMzP1q3yRSwHmNI7bDkCLyJrmVUjkYUo9vc9DYaEyo2OOLTfy0NV2AuanfvQJUlIBUn47oxZ4bUkOn17kJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619780; c=relaxed/simple;
	bh=qHKvDC7J6u4sXlcBp8qdTF1AvREdbzHF7SFt0T2u97M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dL5zq0Z9Ccc17HxrUnCbAcXA9pwd9l7cfKCD1jUR6V0F2mncGewITWQ00A4j6Aja6rJZt2AOEo3tBT30Q0ed/XBLNrDceFCMvgBsI8PlfnCU2Ri9McJFDChXhifJJOH3CVIlC5HvZ051RjQVtC4/cTVKyGN19eKYMDoJ/uHkPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 0E033B6058;
	Tue, 19 Aug 2025 16:09:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id BF97C32;
	Tue, 19 Aug 2025 16:09:25 +0000 (UTC)
Date: Tue, 19 Aug 2025 12:09:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mohammad Gomaa <midomaxgomaa@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kenalba@google.com,
 hbarnor@chromium.org, rayxu@google.com
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <20250819114641.26223fb9@gandalf.local.home>
In-Reply-To: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
References: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: jymgoxbcd1j99grf4xufu6juzhrogc7q
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: BF97C32
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+DOo1mg2HDL1m0POdHkmE/+M1wqI6Oy54=
X-HE-Tag: 1755619765-711634
X-HE-Meta: U2FsdGVkX19So0sr3hqpN3UgOBNxBYhcGbyjzSjOl0sDImiybizaTrvM78DHlqqj7etV1LxOHXq5jfMdNYaQQJmvJV7swErYMQuYhXB9zqM/+Wz49YUBi8EKYXNwl+SoQZ1zzRAE6nByTpkEkMdyXBzPTVN4sP5qdFJByLuK9dvaauQuxQ2sZn+AOIejo90AB7SfesHUo16FeJA/uYoJZYNF8ZOFL33RGxyzZ3UhnEstKGJHZgX18YlxcB6ox/7X7dzBsB4TVSHceIQSWIEqZ3ma9/OYxLcm3jvldvpWxIqQvUEJhL1m69ZwfpLGxOxBC1T85tkzJBDSp53TGRI4AgX/F88uqQjXON30w9cfiVSLFDT/ThTHmiI4K1I3lMueJLobUIVqwtJdYlwiup8Vvg==

On Sun, 17 Aug 2025 10:55:14 +0300
Mohammad Gomaa <midomaxgomaa@gmail.com> wrote:

> Hello,
> 
> This patch adds tracepoints to i2c-core-base to aid with debugging I2C probing failrues.
> 
> The motivation for this comes from my work in Google Summer of Code (GSoC) 2025:
> "ChromeOS Platform Input Device Quality Monitoring"
> https://summerofcode.withgoogle.com/programs/2025/projects/uCdIgK7K
> 
> This is my first submission to the Linux kernel, so any feedback is welcome.

Welcome Mohammad!

>  	driver = to_i2c_driver(dev->driver);
>  

I'll let those that own this code discuss the merits of this, and if
there's a better way to achieve this. But I'll comment only on the tracing
aspect of this change.

> +	has_id_table = driver->id_table;
> +	has_acpi_match = acpi_driver_match_device(dev, dev->driver);
> +	has_of_match = i2c_of_match_device(dev->driver->of_match_table, client);
> +
> +	if (!has_id_table)
> +		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_NO_I2C_ID_TABLE);
> +	if (!has_acpi_match)
> +		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_ACPI_ID_MISMATCH);
> +	if (!has_of_match)
> +		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_OF_ID_MISMATCH);

The above adds if statements into the running code when tracing is disabled
and this causes pressure on the branch prediction and should be avoided. To
avoid this, you could use the trace_<tracepoint>_enabled() helper:

	if (trace_i2c_device_probe_debug_enabled()) {
		has_id_table = driver->id_table;
		has_acpi_match = acpi_driver_match_device(dev, dev->driver);
		has_of_match = i2c_of_match_device(dev->driver->of_match_table, client);

		if (!has_id_table)
			trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_NO_I2C_ID_TABLE);
		if (!has_acpi_match)
			trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_ACPI_ID_MISMATCH);
		if (!has_of_match)
			trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_OF_ID_MISMATCH);
	}

But I suspect there's a better way to record this information. I just
wanted to inform you on the trace_<tracepoint>_enabled() logic. What it
does is to add a static branch (jump label) where there's no "if"
statement. It's either a nop that skips this code altogether, or it's a jmp
to the code that will do the logic as well as the tracing and then jump
back to where it left off.

It's much more efficient to use this and it doesn't add anything to the
branch prediction cache.

-- Steve

