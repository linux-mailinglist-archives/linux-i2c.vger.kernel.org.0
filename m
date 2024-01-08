Return-Path: <linux-i2c+bounces-1207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F7826FA8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B723C1C22833
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 13:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BFC41768;
	Mon,  8 Jan 2024 13:23:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A744C78;
	Mon,  8 Jan 2024 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CAEAE61E5FE03;
	Mon,  8 Jan 2024 14:22:09 +0100 (CET)
Message-ID: <34c13a37-4e58-4913-9db6-9819f76fbfb4@molgen.mpg.de>
Date: Mon, 8 Jan 2024 14:22:09 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Dell contacts (was: [PATCH 6/6] platform/x86: dell-smo8800: Add
 support for probing for the accelerometer i2c address)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
 <20231224220742.5cv2a7tdd4f2k4mt@pali>
 <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Greg,


Am 05.01.24 um 17:36 schrieb Hans de Goede:

> On 12/24/23 23:07, Pali Rohár wrote:
>> On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
>>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>>> of the accelerometer. So a DMI product-name to address mapping table
>>> is used.
>>>
>>> At support to have the kernel probe for the i2c-address for models
>>> which are not on the list.
>>>
>>> The new probing code sits behind a new probe_i2c_addr module parameter,
>>> which is disabled by default because probing might be dangerous.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> I would really like to hear Dell opinion about this change, and if there
>> is really no way to get i2c address. Could you ask Dell people about it?
>> Always it is better to use official / vendor provided steps of hardware
>> detection, instead of inventing something new / own which would be there
>> for a long time...
> 
> Unfortunately I no longer have any contacts inside Dell for
> this and given Dell's non response in the original thread
> which started this I'm not hopeful for help from Dell here.

Unfortunately, since Mario Limonciello left Dell and works at AMD now, 
despite adding Dell.Client.Kernel@dell.com to Cc: I never received a 
reply from them. Do you have any contacts?

(Dell ships Ubuntu on the “developer machines”, but I could never figure 
out, how the relationship works. At least the Dell support always said, 
GNU/Linux support is provided by “the community”.)


Kind regards,

Paul

