Return-Path: <linux-i2c+bounces-2107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBB86ECEF
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 00:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0446A1F22FA2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 23:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66BE5EE8B;
	Fri,  1 Mar 2024 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbOkJsWv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8134F5EE80;
	Fri,  1 Mar 2024 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709335518; cv=none; b=AKwdrIdhyd0Lm60JAnIgPTnJAdBEMfhTpEQVwZXLLADZmSu4hJnwUmPY3N/WJV1DMClG4oX2vwwemjieqtYaI6xioia+DidlNea2+BFhVKgIWZMcS0L8bAA2mdQM2UOH4T4H29lAk9ilDD7yQhMb9vVVplQq+qb1Okuo0oe20t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709335518; c=relaxed/simple;
	bh=XK0Tl3Zm+PRg0/fNwIGqf/8a+6s//mFri+7E886mdsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjB82IS7/jZB5vIretMLHtfhHV4zDQNjULGurL/3FWJ30ckTH0d+1TIpDTKTCa7EbSG8DTNrDtol0qboRZiQpbMOP4wGKG/hAOyJYZBV96Zp0+U8gVpurhhNF7qgXNA4O6A6l9vv6dDFAjrpIN8g9hDLk6rAGQ4RQRMiKehcSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbOkJsWv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91241C433C7;
	Fri,  1 Mar 2024 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709335518;
	bh=XK0Tl3Zm+PRg0/fNwIGqf/8a+6s//mFri+7E886mdsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbOkJsWvKR5NigL30sEPMBxS0GaiLcP5S5tlVTpqttz95usLUjZCGVnbTjN/UuhTy
	 MAvkKS0m8pIbJHoyy9B4wnvARGI3U7zFZww5TodNAoRWjzSHmPnNJArDjKsKe+JQdZ
	 MAp9+UC9iAXctVipXl02FHka2h8KLTieqhprsEjvIA5jTXy3zAh14YijwzzFuwj+/K
	 WdGz4ALPfMp8Uf9JkDVVb9u8FCLf6TDTdXqzrVv8xyzWfvNx0Om77UUHgBY04GnxEA
	 SVoPG1qOdHCpb3vRaRoFDo7TGW1E/t8bAonyQ0nr7z6xo5/VBEUsYLL7flZGBAqEVP
	 GD7pMsN8EHkYA==
Date: Sat, 2 Mar 2024 00:25:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc: mika.westerberg@linux.intel.com, wsa+renesas@sang-engineering.com, 
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: acpi: Unbind mux adapters before delete
Message-ID: <c54jmcv3qodf2uaicsobifqc22pvfwcyfwlqkgav7p7bqnsosx@ln3zxp6acng6>
References: <20240229214940.299586-1-hamish.martin@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229214940.299586-1-hamish.martin@alliedtelesis.co.nz>

Hi Hamish,

On Fri, Mar 01, 2024 at 10:49:39AM +1300, Hamish Martin wrote:
> There is an issue with ACPI overlay table removal specifically related
> to I2C multiplexers.
> 
> Consider an ACPI SSDT Overlay that defines a PCA9548 I2C mux on an
> existing I2C bus. When this table is loaded we see the creation of a
> device for the overall PCA9548 chip and 8 further devices - one
> i2c_adapter each for the mux channels. These are all bound to their
> ACPI equivalents via an eventual invocation of acpi_bind_one().
> 
> When we unload the SSDT overlay we run into the problem. The ACPI
> devices are deleted as normal via acpi_device_del_work_fn() and the
> acpi_device_del_list.
> 
> However, the following warning and stack trace is output as the
> deletion does not go smoothly:
> ------------[ cut here ]------------
> kernfs: can not remove 'physical_node', no directory
> WARNING: CPU: 1 PID: 11 at fs/kernfs/dir.c:1674 kernfs_remove_by_name_ns+0xb9/0xc0
> Modules linked in:
> CPU: 1 PID: 11 Comm: kworker/u128:0 Not tainted 6.8.0-rc6+ #1
> Hardware name: congatec AG conga-B7E3/conga-B7E3, BIOS 5.13 05/16/2023
> Workqueue: kacpi_hotplug acpi_device_del_work_fn
> RIP: 0010:kernfs_remove_by_name_ns+0xb9/0xc0
> Code: e4 00 48 89 ef e8 07 71 db ff 5b b8 fe ff ff ff 5d 41 5c 41 5d e9 a7 55 e4 00 0f 0b eb a6 48 c7 c7 f0 38 0d 9d e8 97 0a d5 ff <0f> 0b eb dc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 0018:ffff9f864008fb28 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: ffff8ef90a8d4940 RCX: 0000000000000000
> RDX: ffff8f000e267d10 RSI: ffff8f000e25c780 RDI: ffff8f000e25c780
> RBP: ffff8ef9186f9870 R08: 0000000000013ffb R09: 00000000ffffbfff
> R10: 00000000ffffbfff R11: ffff8f000e0a0000 R12: ffff9f864008fb50
> R13: ffff8ef90c93dd60 R14: ffff8ef9010d0958 R15: ffff8ef9186f98c8
> FS:  0000000000000000(0000) GS:ffff8f000e240000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f48f5253a08 CR3: 00000003cb82e000 CR4: 00000000003506f0
> Call Trace:
>  <TASK>
>  ? kernfs_remove_by_name_ns+0xb9/0xc0
>  ? __warn+0x7c/0x130
>  ? kernfs_remove_by_name_ns+0xb9/0xc0
>  ? report_bug+0x171/0x1a0
>  ? handle_bug+0x3c/0x70
>  ? exc_invalid_op+0x17/0x70
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? kernfs_remove_by_name_ns+0xb9/0xc0
>  ? kernfs_remove_by_name_ns+0xb9/0xc0
>  acpi_unbind_one+0x108/0x180
>  device_del+0x18b/0x490
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  device_unregister+0xd/0x30
>  i2c_del_adapter.part.0+0x1bf/0x250
>  i2c_mux_del_adapters+0xa1/0xe0
>  i2c_device_remove+0x1e/0x80
>  device_release_driver_internal+0x19a/0x200
>  bus_remove_device+0xbf/0x100
>  device_del+0x157/0x490
>  ? __pfx_device_match_fwnode+0x10/0x10
>  ? srso_return_thunk+0x5/0x5f
>  device_unregister+0xd/0x30
>  i2c_acpi_notify+0x10f/0x140
>  notifier_call_chain+0x58/0xd0
>  blocking_notifier_call_chain+0x3a/0x60
>  acpi_device_del_work_fn+0x85/0x1d0
>  process_one_work+0x134/0x2f0
>  worker_thread+0x2f0/0x410
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xe3/0x110
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x2f/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> ---[ end trace 0000000000000000 ]---
> ...
> repeated 7 more times, 1 for each channel of the mux
> ...
> 
> The issue is that the binding of the ACPI devices to their peer I2C
> adapters is not correctly cleaned up. Digging deeper into the issue we
> see that the deletion order is such that the ACPI devices matching the
> mux channel i2c adapters are deleted first during the SSDT overlay
> removal. For each of the channels we see a call to i2c_acpi_notify()
> with ACPI_RECONFIG_DEVICE_REMOVE but, because these devices are not
> actually i2c_clients, nothing is done for them.
> 
> Later on, after each of the mux channels has been dealt with, we come
> to delete the i2c_client representing the PCA9548 device. This is the
> call stack we see above, whereby the kernel cleans up the i2c_client
> including destruction of the mux and its channel adapters. At this
> point we do attempt to unbind from the ACPI peers but those peers no
> longer exist and so we hit the kernfs errors.
> 
> The fix is to augment i2c_acpi_notify() to handle i2c_adapters. But,
> given that the life cycle of the adapters is linked to the i2c_client,
> instead of deleting the i2c_adapters during the i2c_acpi_notify(), we
> just trigger unbinding of the ACPI device from the adapter device, and
> allow the clean up of the adapter to continue in the way it always has.
> 
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

I guess you need here:

Fixes: 525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifications")
Cc: <stable@vger.kernel.org> # v4.8+

Even though it's a bit too old as a patch and I'm not sure it
would apply to 4.8.

In any case,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

