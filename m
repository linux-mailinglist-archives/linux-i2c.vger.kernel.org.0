Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2332515BB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 11:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgHYJxy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 25 Aug 2020 05:53:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:50584 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgHYJxx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 05:53:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CC3FDAD1B;
        Tue, 25 Aug 2020 09:54:22 +0000 (UTC)
Date:   Tue, 25 Aug 2020 11:53:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 2/2] i2c: eg20t: use generic power management
Message-ID: <20200825115342.16ab9004@endymion>
In-Reply-To: <20200807202321.GA753887@bjorn-Precision-5520>
References: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
        <20200807202321.GA753887@bjorn-Precision-5520>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn, Vaibhav,

On Fri, 07 Aug 2020 15:23:21 -0500, Bjorn Helgaas wrote:
> Also, i801_suspend() looks suspicious because it writes SMBHSTCFG, but
> I don't see anything corresponding in i801_resume().

You're right, it's buggy. Volker Rümelin's patch at:

https://patchwork.ozlabs.org/project/linux-i2c/patch/a2fc5a6d-a3bf-eaf0-bb75-1521be346333@googlemail.com/

should fix it. I was supposed to review it but did not, shame on me.
I'll do it today.

-- 
Jean Delvare
SUSE L3 Support
