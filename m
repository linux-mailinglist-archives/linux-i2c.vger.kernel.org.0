Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D4A37F675
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 13:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhEMLKT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 May 2021 07:10:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:59774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232957AbhEMLKR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 May 2021 07:10:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D47CA61422;
        Thu, 13 May 2021 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620904148;
        bh=uoluFBaduD5lLVV4XzN00NtHyh9peG4uBDHAHqnWv8o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=M1wGDTMKy1JRRL4gmij6N2CDAmH/WNMowt8QqCeFvj1GA88YVvXSxqRhM4cCEnrdq
         8aC4N3MvF7e6MZd2xAJkSqPp2tI2PDgwUMW81v9Xxgi2SoTi58cJLuOnslYZXqIu3q
         9im0/s4exVXCQciNOfNZmjRe/1/njdMeP73nmHvTV61QdeZO4R55p38NfMmr0H4iKl
         98xBUKRNjWQKPS3/nhysSswwwD0L7H1xXeBNIq8PX1hD/Y/BwjwTTCWvvxTOhXkR9R
         jdeKLVWaRD5Bup9p+FkCqjbfSyRcc2ax8fsq6xUjfoIW92h9OlI4sflBSDjxYeEKfR
         IWzHRz9iqP/KQ==
Date:   Thu, 13 May 2021 13:09:04 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     trix@redhat.com, benjamin.tissoires@redhat.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] HID: ft260: improve error handling of
 ft260_hid_feature_report_get()
In-Reply-To: <20210511101208.16401-1-michael.zaidman@gmail.com>
Message-ID: <nycvar.YFH.7.76.2105131308260.28378@cbobk.fhfr.pm>
References: <20210511101208.16401-1-michael.zaidman@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 11 May 2021, Michael Zaidman wrote:

> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> 
> The ft260_hid_feature_report_get() checks if the return size matches
> the requested size. But the function can also fail with at least -ENOMEM.
> Add the < 0 checks.
> 
> In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
> buffer if there is an error.
> 
> ---
> v4   Fixed commit message
> ---
> v3   Simplify and optimize the changes
> ---
> v2:  add unlikely()'s for error conditions
> ---
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

Who should be the author of the git commit?

Thanks,

-- 
Jiri Kosina
SUSE Labs

