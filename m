Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482DA5954D3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 10:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbiHPIRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 04:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiHPIRD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 04:17:03 -0400
X-Greylist: delayed 604 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Aug 2022 23:13:42 PDT
Received: from vsp01-out.oderland.com (vsp01-out.oderland.com [IPv6:2a02:28f0::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E948128463
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 23:13:41 -0700 (PDT)
X-Scanned-Cookie: 267db6f8f9a97f6a9e31a6b4b0d50f1894f1cfd3
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
        by vsp-out.oderland.com (Halon) with ESMTPSA
        id 2997716a-1d29-11ed-956b-cb16337fe68d;
        Tue, 16 Aug 2022 08:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=c8YLESDczNl4zZKMBBfe/4JBhOkqBbKwDqf2+ardIQc=; b=HhSUAIBGJSFYtJ34MUPdUIoRz1
        8R2DnTRvwWorARYUIRnE31vxjE7j2uxmzWokFvojeTnd5WSZkbjvKzN5LtLxvfBniNNj4VO9PgSHG
        xQ3b+5bSNt0pGYS6gO50f+QcYroYD0Nf+ofEkfRXf/ih9cEjE3V9xRwvPyIWg745zcuy5+XINFndE
        HJu4OHtFD4aa/lIZS27unMUxhMP/dFNKasJiEIcd+WI9mgR66eHpZZ7Nth1Nzv1dGD16jxTlDTj6i
        mXZ/paZTthRPas/xh/ABS7unZ/q7oSpVTMlhvXhxMRJlDiRVZHG7IgjeEvE3Pf+f70dCQn4MV6Brq
        TKXhvYQQ==;
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:34034 helo=[10.137.0.14])
        by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <josef@oderland.se>)
        id 1oNpfr-004luK-Nm;
        Tue, 16 Aug 2022 08:03:34 +0200
Message-ID: <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
Date:   Tue, 16 Aug 2022 08:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20220708120958.74034-1-andriy.shevchenko () linux ! intel ! com>
Content-Language: en-US
From:   Josef Johansson <josef@oderland.se>
In-Reply-To: <20220708120958.74034-1-andriy.shevchenko () linux ! intel ! com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-oderland-domain-valid: yes
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/8/22 14:09, Andy Shevchenko wrote:

> Replace open coded device_get_match_data() in acpi_smbus_cmi_add().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: used device_get_match_data()
> v3: fixed couple of warnings (LKP)
>   drivers/i2c/busses/i2c-scmi.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
> index 6746aa46d96c..79798fc7462a 100644
> --- a/drivers/i2c/busses/i2c-scmi.c
> +++ b/drivers/i2c/busses/i2c-scmi.c
> @@ -30,7 +30,7 @@ struct acpi_smbus_cmi {
>   	u8 cap_info:1;
>   	u8 cap_read:1;
>   	u8 cap_write:1;
> -	struct smbus_methods_t *methods;
> +	const struct smbus_methods_t *methods;
>   };
>   
>   static const struct smbus_methods_t smbus_methods = {
> @@ -361,7 +361,6 @@ static acpi_status acpi_smbus_cmi_query_methods(acpi_handle handle, u32 level,
>   static int acpi_smbus_cmi_add(struct acpi_device *device)
>   {
>   	struct acpi_smbus_cmi *smbus_cmi;
> -	const struct acpi_device_id *id;
>   	int ret;
>   
>   	smbus_cmi = kzalloc(sizeof(struct acpi_smbus_cmi), GFP_KERNEL);
> @@ -369,6 +368,7 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
>   		return -ENOMEM;
>   
>   	smbus_cmi->handle = device->handle;
> +	smbus_cmi->methods = device_get_match_data(&device->dev);
>   	strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
>   	strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
>   	device->driver_data = smbus_cmi;
> @@ -376,11 +376,6 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
>   	smbus_cmi->cap_read = 0;
>   	smbus_cmi->cap_write = 0;
>   
> -	for (id = acpi_smbus_cmi_ids; id->id[0]; id++)
> -		if (!strcmp(id->id, acpi_device_hid(device)))
> -			smbus_cmi->methods =
> -				(struct smbus_methods_t *) id->driver_data;
> -
>   	acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
>   			    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
>   

Hi,

I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.

Since I do not have any way of capturing the error except camera (it's a long message), here's my best try.

BUG: kernel NULL pointer dereference, address: 0000000000000000

#PF: supervisor read access in kernel mode

#PF: error_code(0x0800) - not-present page

PGD 0 P4D 0

Oops: 0000 [#1] PREEMPT SMP NOPT

CPU: 3 PID: 1879 Comm: systemd-udevd Tainted: G  W 6.0.0-1.fc32.quebs.x86_64 #1

RIP: e838:acpi_smbus_cmi_add_cap.isra.0+0x45/0x1a0 [i2c_scmi]

Code: 84 00 00 4c 8b 37 4c 89 e7 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 31 c0 48 c7 04 24 ff ff ff ff 48 c7 44 24 08 00 00 00 00 <4c>

RSP: e02b:ffffc98841d1bad8 EFLAGS: 00010246

RAX: 0000000000000000 RBX: ffff88810abb6000 RCX: 0000000000000000

RDX: ffffc90041d1bb23 RSI: ffffc90041d1bb33 RDI: ffffc90041d1bb33

RBP: 0000000000000000 R08: ffff88818127169c R09: 0000000000000000

R10: ffff8881020f56f0 R11: 0000000000000000 R12: ffffc90041d1bb33

R13: 0000000000000000 r14: fffff888181271cc0 R15: 0000000000000000

FS:  00007572507ceb00(0000) GS: ffff8881408c0000(0000) knlGS: 0000000000000000

CS:   e830 DS: 0000 ES: 0000 CR0: 0000000000050033

CR2: 0000000000000000 CR3: 000000010ab1e000 CR4: 0000000000010660

Call Trace:

   <TASK>

   acp_smbus_cmi_query_methods+0x78/0x7f [i2c_scmi]

   acpi_ns_walk_namespace+0xea/0x1cb

   ? acpi_smbus_cmi_add_cap.isra.0+0x1a8/0x1a0 [i2c_scmi]

   ? acpi_smbus_cmi_add_cap.isra.0+0x1a8/0x1a0 [i2c_scmi]

   acpi_ns_walk_namespace+0x99/0xcf

   acpi_smbus_cmi_add+0xad/0x150 [i2c_scmi]

   acpi_device_probe+0xx45/0x160

   call_driver-probe+0x24/0xe0

   really_probe+0xcf/0x2d0

   ? pm_runtime_barrier+0x50/0x90

   __driver_probe_device+0x70/0x180

   driver_probe_device+0x1e/0x90

   __driver_attach+0xc4/0x1e0

   ? __device_attach_driver+0x??

   ? __device_attach_driver+??

   bus_for-each_dev

   bus_add_driver

   driver_register

   ??

   do_one_initcall

   do_init_module

   __do_sys_finit_??

   do_syscall_64

   ? do_syscall_64

   ? syscall_exit_to_??

   ? do_syscall_64

   entry_SYSCALL_64_after??

RIP:

Code:

RSP:

RAX

RZBX

?

R10

R13

  </TASK>

Modules linked in:

CR2: 0000000000000000

---[ end trace

RIP: e830: acpi_smbis_cmi_add_cap.isra

Code:..

RSP..

..

CR2: ?

Kernel panic - not syncing: Fatal exception

Kernel Offset: disabled

   

Cheers

Josef

