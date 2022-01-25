Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851C849BB26
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 19:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiAYSUM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 13:20:12 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:57752 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiAYSTu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 13:19:50 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6EEA5212C7;
        Tue, 25 Jan 2022 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643134788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EYunZ4RoY71WcGBVjnlfH7Jsnj8a/5x/WLZYISnv5kU=;
        b=Yg8a8A43+qs0iROXuqiyEkMGn/gt0w8kSmTijRc6ZqlTwE8ZvkqTefGuSDVjw0Vfsp4UdG
        +hDL5is/9dHFbj/RElOSckgzFSlS4Hp5E83di20qWVC+gzW+zNNhyn/6YP5ym7n6idgP7v
        X6cBKnnyLfX98b79hwQtn5CNO8OzcF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643134788;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EYunZ4RoY71WcGBVjnlfH7Jsnj8a/5x/WLZYISnv5kU=;
        b=7l03trux4+nWlamKzW+e/bLWCKzT/PbMLeyoxhC8+qS+xpL6pgw853Co4dfjkAVJUErS3n
        fETsHoSYLylRgfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADE8613EE1;
        Tue, 25 Jan 2022 18:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ASHZJ0M/8GHJawAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 18:19:47 +0000
Date:   Tue, 25 Jan 2022 19:19:46 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <20220125191946.4213cbee@endymion>
In-Reply-To: <717b02cc-ba0c-ddd4-d15d-cc0828fbb3fd@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-3-terry.bowman@amd.com>
        <20220125144520.17a220bc@endymion>
        <a55ca093-d8d1-6821-1cb9-18343c6f1fd0@amd.com>
        <20220125173857.1c85fddc@endymion>
        <717b02cc-ba0c-ddd4-d15d-cc0828fbb3fd@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 25 Jan 2022 12:02:45 -0600, Terry Bowman wrote:
> On 1/25/22 10:38 AM, Jean Delvare wrote:
> > On Tue, 25 Jan 2022 09:18:59 -0600, Terry Bowman wrote:  
> >> On 1/25/22 7:45 AM, Jean Delvare wrote:  
> >>> On Tue, 18 Jan 2022 14:22:32 -0600, Terry Bowman wrote:    
> >>>> (...)
> >>>> +	if (ret)
> >>>> +		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
> >>>> +			mmio_addr, alt_mmio_addr, ret);    
> > 
> > ... I think that should be a "or" rather than "and", and singular
> > "region", in this error message? I mean, the plan was never to
> > reserve-map both of them, if I understand correctly.
> >   
> 
> This dev_err() is executed when both mmio_addr and alt_mmio_addr addresses failed either 
> devm_request_mem_region() or failed devm_ioremap(). I think the following would be most accurate:
> 
> dev_err(dev, 
>         "Failed to reserve or map the MMIO (0x%X) and alternate MMIO (0x%X) regions, ret=%d",
>         mmio_addr, alt_mmio_addr, ret);  
> 
> Above is my preference but I don't have a strong opinion. Providing the address and error code 
> information in the message is most important. I will make the change as you requested. 

I agree, fine with me, no worry.

-- 
Jean Delvare
SUSE L3 Support
