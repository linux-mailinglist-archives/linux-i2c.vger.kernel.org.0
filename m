Return-Path: <linux-i2c+bounces-7785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEAA9BD1B4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9FC1C23FF6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00531553A2;
	Tue,  5 Nov 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="z1SQh79Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEE153803;
	Tue,  5 Nov 2024 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822818; cv=none; b=i+WhMragegqlk7Y7rrziiw/fenDAkxVm/l/c63oueCnA31MrnMgSSqwWZ/u7T9ipKvMd+0mIMICqKoSW78uoUdSKWk07KPXhY3q4OrAbc81Up8CycKMxdzhvyxymLCpI/FJ8BfjHa3TC8fgFZImrFzH96GhGWXNclhAKga1Ys2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822818; c=relaxed/simple;
	bh=4ApIw3HJ3hgEf+fhLQxN1/XllC+Yt4u3fL9wFE1jfE4=;
	h=Message-ID:Date:MIME-Version:From:Cc:To:Subject:Content-Type; b=lDVc9uLCgXOqjo3anakIs63xmCYgXvN459pIVwkAnPtH6hPSSDMqoj4VFDDnkRrYSlHywJyxkew0TOWTpoKB/BoCEQEkv+JQMmwihnl6OYDXfhybQSzLCABCsfTW5szJv/eYReIjMlDyihd4XInNZloTqZRUuxmdvf4A7aqipw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=z1SQh79Y; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:Subject:To:Cc:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To
	:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=mQc7lWzHCyCjYnIsVOvc+e8k8hrhVFudLaJEfs6UEic=; t=1730822816;
	x=1731254816; b=z1SQh79YSlk0+7YTkX2D0KqmPzUM/KvAZgXOQ4DZT8jT3pvOaltLMSWzYzhBi
	9/L6XxrPRIJOvKFSLvA6CZsaCyzsF9+vOAkueTWYtjvzlS12F/58nYYTLbq+zydyfe+IhY6RI2jc8
	kOA5TVFAdCIkwyismgCPdWYDG+aV8syoVvYDDD+q6b1VXthidlbMiZ/wejGdyb/ggLb/LGD/d1nRD
	BkK/uAtwfL8Caszx5Zenbp+j2o7jq25eq1Y7g8Dw5NnAMdYqtlY0unxqQ1VNA445cV7haGLW/HcTe
	9Cruc73Cb33HKjpH1vDbgaAu2RtEA9JeMixR52fW45FGgYGvIg==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t8M4z-00036t-3A; Tue, 05 Nov 2024 17:06:53 +0100
Message-ID: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
Date: Tue, 5 Nov 2024 17:06:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-MW
Cc: Michael <auslands-kv@gmx.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [regression] Bug 219440: Touchscreen stops working after Suspendi:
 i2c_designware.1: controller timed out
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730822816;02c93da8;
X-HE-SMSGID: 1t8M4z-00036t-3A

Hi, Thorsten here, the Linux kernel's regression tracker.

Jarkko, I noticed a report about a regression in bugzilla.kernel.org
that appears to be related to i2c_designware (at least it looks like
that to my untrained eyes). As many (most?) kernel developers don't keep
an eye on the bug tracker, I decided to write this mail. To quote from
https://bugzilla.kernel.org/show_bug.cgi?id=219440 :

>  Michael 2024-10-29 08:43:55 UTC
>
> Just noticed that the touchscreen on my ASUS vivobook S14 stops
> working after a suspend-to-idle. As this is something, I clearly
> didn't have before, I tested every kernel version released in the
> last six months and found the kernel, where the bug was introduced:
> 6.10. The last 6.9.12 is still working correctly. Since 6.10 all
> kernel versions have the problem.
> 
> Some more info:
> 
> Hardware: ASUS Vivobook S14 (TP3402VA) Kernel working: up to 6.9.12 
> Kernel defect: from 6.10 OS: nixos
> 
> I do not have much knowledge about the input devices. I tested that
> i2c_hid_acpi seems to be relevant for the touchscreen (and also the
> touchpad), as, when I remove it, both stop working. Reloading the
> kernel module restores functionality (but NOT after a suspend-to-
> idle!!!). Otherwise, I do not see any error messages or so. (Or do
> not recognize them...)
> 
> Any help I can offer to identify the regression bug?

[...]

> 6.12-rc4 does not work either. The regression started with 6.10.

[...]

> i2c_designware i2c_designware.1: controller timed out
> i2c_designware i2c_designware.1: timeout in disabling adapter
> i2c_hid_acpi i2c-WDHT1F01:00: failed to change power setting.
> i2c_hid_acpi i2c-WDHT1F01:00: PM: dpm_run_callback(): acpi_subsys_resume returns -110
> i2c_hid_acpi i2c-WDHT1F01:00: PM: failed to resume async: error -110
[...]

See the ticket for more details. The reporter (Michael) is CCed.

Michael: if this mail is fruitless, you most like need to use git bisect
to find the change that broke things. For details, see:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
https://docs.kernel.org/admin-guide/bug-bisect.html

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"

P.S.: let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.9..v6.10
#regzbot title: i2c: designware: touchscreen stops working after Suspend
#regzbot from: Michael <auslands-kv@gmx.de>
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219440
#regzbot ignore-activity

