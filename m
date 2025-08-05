Return-Path: <linux-i2c+bounces-12157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA611B1BBA3
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 23:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 170FF7AFBF7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 21:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D58B24169A;
	Tue,  5 Aug 2025 21:07:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C012721FF2D;
	Tue,  5 Aug 2025 21:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754428067; cv=none; b=k3UqOFvo5or6bf8nNuLNoWB0vChaTym4B2qhHub62AM2f1+2+rmeVnXGRFqsBROFR9sh15zwBhiQ54e48xq1xggpk+W+6ZW6AYGXJakYiBCOFExP8ADNZCWGAiX43JW/42sLNnbN2+lbVEii3LoG81fM2OqRw5be8MWYrsaYhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754428067; c=relaxed/simple;
	bh=2sNQ0Va3Wkk3KtTPynj/Pf6/rVIuhWWX8vzhbm0vmmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGoGG53nhUGLDvpQPLKEGPgm4R/Ygmi4Wv7l0Ec7bq8RTxPBtI4uU3oyHAJSFFT4kZJCURvBesi57HZeqK/QmAeDg3U/koRAeqRGEkvFUOegEYvdjeChn+AflD4sICQ03vQVvJgjNuheQkEw/lj1CKKYktKBGQTQFdfh0tdrwEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a02:8084:255b:aa00:7b12:35fe:1712:13bc] (unknown [IPv6:2a02:8084:255b:aa00:7b12:35fe:1712:13bc])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 7CDB34230E;
	Tue,  5 Aug 2025 21:07:42 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a02:8084:255b:aa00:7b12:35fe:1712:13bc) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a02:8084:255b:aa00:7b12:35fe:1712:13bc]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <c1520e91-4ca2-4244-b335-62ab5509b8d0@arnaud-lcm.com>
Date: Tue, 5 Aug 2025 22:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hid: fix I2C read buffer overflow in raw_event() for
 mcp2221
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
References: <20250726220931.7126-1-contact@arnaud-lcm.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: <20250726220931.7126-1-contact@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175442806300.8956.3593607534755415224@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi Benjamin,
I’m forwarding this patch to you since I noticed that Rishi’s last 
activity on the Linux mailing list was
over three years ago, he may no longer be actively involved.
Please let me know if this is the right approach or if there’s a more 
appropriate way to proceed.
I’d hate to cause any inconvenience.

Cheers,
Arnaud

On 26/07/2025 23:09, Arnaud Lecomte wrote:
> As reported by syzbot, mcp2221_raw_event lacked
> validation of incoming I2C read data sizes, risking buffer
> overflows in mcp->rxbuf during multi-part transfers.
> As highlighted in the DS20005565B spec, p44, we have:
> "The number of read-back data bytes to follow in this packet:
> from 0 to a maximum of 60 bytes of read-back bytes."
> This patch enforces we don't exceed this limit.
>
> Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
> Tested-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> ---
>   drivers/hid/hid-mcp2221.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 0f93c22a479f..83941b916cd6 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -814,6 +814,10 @@ static int mcp2221_raw_event(struct hid_device *hdev,
>   			}
>   			if (data[2] == MCP2221_I2C_READ_COMPL ||
>   			    data[2] == MCP2221_I2C_READ_PARTIAL) {
> +				if (!mcp->rxbuf || mcp->rxbuf_idx < 0 || data[3] > 60) {
> +					mcp->status = -EINVAL;
> +					break;
> +				}
>   				buf = mcp->rxbuf;
>   				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
>   				mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];

