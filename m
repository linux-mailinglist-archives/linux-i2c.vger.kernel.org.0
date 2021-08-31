Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AE43FC686
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 13:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbhHaL1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 07:27:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43896 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241379AbhHaL1G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Aug 2021 07:27:06 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 107B620162;
        Tue, 31 Aug 2021 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1630409171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/9SFWtiOPIESpH37JD6F68KELXZNR++2goyG9PD0byM=;
        b=RjH5trcULmt+1ajZX/hr5P4SSTgUDInU3By4SV09MlKEsMYcqR+viQE0mJn6Cnp7Ux1Dp7
        6b5LvyoI0kkI6/f7+v21YZF06lbD8KtzWfECktxkL6EXvDidh5d5D+47FlK2VAx671tK0A
        3vE72WH/z40Xw/B+PU5gVmcgMP60IHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1630409171;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/9SFWtiOPIESpH37JD6F68KELXZNR++2goyG9PD0byM=;
        b=FFN++RqNU/1vys1a8c9P0D56SFUfqCAQ5Q6RHlETF0Q90PCChYEqRSqSIETwGAoQcTca/s
        RdLn3wxxIiO+6YDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9D7C913A8B;
        Tue, 31 Aug 2021 11:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 3F1OI9IRLmFfDAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 31 Aug 2021 11:26:10 +0000
Date:   Tue, 31 Aug 2021 13:26:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <20210831132609.201c37f2@endymion>
In-Reply-To: <41456674-800b-a4c2-3b2c-d5af18c58e61@gmail.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <10690555-2317-4916-70b8-870708858f9b@gmail.com>
        <YRPvtPid3EeMylSr@smile.fi.intel.com>
        <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
        <YRTubuupevq0JMbW@smile.fi.intel.com>
        <YRwY/q2y3eIjc/nr@kunai>
        <20210826160021.67b7ed92@endymion>
        <41456674-800b-a4c2-3b2c-d5af18c58e61@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 31 Aug 2021 08:05:41 +0200, Heiner Kallweit wrote:
> On 26.08.2021 16:00, Jean Delvare wrote:
> > If pm_runtime_set_autosuspend_delay() is not suitable for the task then
> > maybe we need a better API. I will admit I'm at a loss when it comes to
> > the many pm_runtime_* calls, I'm not going to claim I fully understand
> > what each of them is doing exactly. But don't we want to simply call
> > pm_runtime_dont_use_autosuspend() here?
> > 
> > If not and there's no suitable API for the task at the moment, then
> > better do not apply this patch, and instead ask the PM subsystem
> > maintainers if they would be willing to implement what we need.
>
> To follow-up on this: This patch has been applied already. Therefore,
> if decision is to not go with it, it would need to be reverted.

Technically it's not in Linus' tree yet ;-)

I'm still interested to know if pm_runtime_dont_use_autosuspend() is
the right call to use in this situation.

-- 
Jean Delvare
SUSE L3 Support
