Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E76428A89
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 12:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbhJKKKD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 06:10:03 -0400
Received: from foss.arm.com ([217.140.110.172]:42322 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235695AbhJKKKD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 06:10:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 750541FB;
        Mon, 11 Oct 2021 03:08:03 -0700 (PDT)
Received: from bogus (unknown [10.57.21.181])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 195683F66F;
        Mon, 11 Oct 2021 03:08:00 -0700 (PDT)
Date:   Mon, 11 Oct 2021 11:07:15 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 07/14] mailbox: pcc: Use PCC mailbox channel pointer
 instead of standard
Message-ID: <20211011100715.yhi4pmre6h2nglfc@bogus>
References: <20210917133357.1911092-1-sudeep.holla@arm.com>
 <20210917133357.1911092-8-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917133357.1911092-8-sudeep.holla@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Guenter,

On Fri, Sep 17, 2021 at 02:33:50PM +0100, Sudeep Holla wrote:
> Now that we have all the shared memory region information populated in
> the pcc_mbox_chan, let us propagate the pointer to the same as the
> return value to pcc_mbox_request channel.
> 
> This eliminates the need for the individual users of PCC mailbox to
> parse the PCCT subspace entries and fetch the shmem information. This
> also eliminates the need for PCC mailbox controller to set con_priv to
> PCCT subspace entries. This is required as con_priv is private to the
> controller driver to attach private data associated with the channel and
> not meant to be used by the mailbox client/users.
> 
> Let us convert all the users of pcc_mbox_{request,free}_channel to use
> new interface.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

Any objections ? If you are OK, can I have your ack so that the series
can go in one go.

-- 
Regards,
Sudeep
