Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4205A36AF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH3MVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:21:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:34370 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727788AbfH3MVS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:21:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8A3B3B621;
        Fri, 30 Aug 2019 12:21:17 +0000 (UTC)
Date:   Fri, 30 Aug 2019 14:21:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc:     "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>,
        "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Message-ID: <20190830142124.1efbab68@endymion>
In-Reply-To: <2cd456ae-7e90-6c8d-32f4-5efa03823b84@nokia.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
        <20190828155822.7cb13a7b@endymion>
        <2cd456ae-7e90-6c8d-32f4-5efa03823b84@nokia.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 30 Aug 2019 11:35:46 +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> Hello Jean,
> 
> On 28/08/2019 15:58, Jean Delvare wrote:
> > Also it is mandatory to restore the value of SMBSLVCMD before returning
> > the control back to the BIOS. Currently this is only being done when
> > the FEATURE_HOST_NOTIFY bit is set because that's the only case where
> > we change the value of that register, but if we change it
> > unconditionally then it must be saved and restored unconditionally too.  
> 
> could you please tell a bit more about the use case, where/how exactly one
> can "return control back to the BIOS"? Maybe referencing the functions in
> the driver...

i801_remove() and i801_shutdown(). Basically when you reboot the
system. Possibly also on suspend-to-disk in certain cases, I'm not
sure. In general shutdown + cold boot is OK either way because on cold
boot the chipsets gets hard-reset anyway.

-- 
Jean Delvare
SUSE L3 Support
