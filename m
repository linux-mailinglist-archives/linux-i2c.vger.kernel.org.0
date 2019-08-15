Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2038F378
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 20:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbfHOSdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 14:33:03 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44455 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfHOSdC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Aug 2019 14:33:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so1643063pgl.11;
        Thu, 15 Aug 2019 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rvhgIfiAcLo5VhLT6MFATYs/CalMc2TfDSCJaauWHBA=;
        b=GRnoxNhWMIdhH+FFenKnBtccjesFa4axTMx0cpMDVJ/ugA+mkjeGSXVLwxisgztXSP
         3XymaANLePnVMDHtd08GB6EAJGYxsi7mylG201dlD+7/CfL/80/ZnC88zTxmjYalRHqN
         OT1u7e/+MBakkyc4gohkdmseHcDCJAP6J0aZluNfQ4Z33+w5pJA5SaAHADktvLf/19Tt
         04GwObaWjxbBbKX71bi0OLZfkxq5X1ux57/sULCT3c50yRJhuOgi6UW5DXxAJ5EddKIG
         a7X8oB9XO0jQvM6+HMAf5T6rEfoEB0n76xW0FVjfYR65MoLet0n+xwr8YXEeweP9qBdr
         BbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rvhgIfiAcLo5VhLT6MFATYs/CalMc2TfDSCJaauWHBA=;
        b=qcRq7vTT8vILByX+5htfvxQT/EN4zXjEChxERwbB11tiIM5/eHhIUVdIfsu3f3Xyqz
         cR6n/VOGChO7Kg3GoL7ciWWdgf+flvVqPT5dKgTyVz2uuxb1VEHLWmM3/QS8IUTGjj8E
         MtH2k+zKLa6mctOEgdP6k/GLLKASIGAdLDIzNcAME86G2FAsAMkpg5bnSbP0CdhxNuVZ
         LtMSSj+svx1xkFj8fCOniqt4DcXVBXKFjPn0HsyPkgGFiQth24bFqo7P4Zs01WaKei0/
         DmrhhGzNNlaBFSTS0tlWMGhDntbk2e84jI0neVYf1VMk/h9phI2ewvww1pHfuVF/msJQ
         5Qnw==
X-Gm-Message-State: APjAAAUWN7HI6ng7PCSNXI8CDfhyJQQVrwe43TAzBpOveQy09REiHSx6
        J/qqxu6yBQeqp2T0J0Kv5qg=
X-Google-Smtp-Source: APXvYqwaTvG+dXpud8t+SGDZs0MUgLf73XKT6y5QDWsZN7z+RrSon07LwGoYiLQmIW26Y7Zz8ZiV/g==
X-Received: by 2002:a17:90a:feb:: with SMTP id 98mr3282646pjz.55.1565893982140;
        Thu, 15 Aug 2019 11:33:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 136sm3867841pfz.123.2019.08.15.11.33.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:33:01 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:33:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v3 2/3] hwmon/ltc2990: Generalise DT to fwnode support
Message-ID: <20190815183300.GA18227@roeck-us.net>
References: <20190815125802.16500-1-max@enpas.org>
 <20190815125802.16500-2-max@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815125802.16500-2-max@enpas.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 15, 2019 at 02:58:01PM +0200, Max Staudt wrote:
> ltc2990 will now use device_property_read_u32_array() instead of
> of_property_read_u32_array() - allowing the use of software nodes
> via fwnode_create_software_node().
> 
> This allows code using i2c_new_device() to specify a default
> measurement mode for the LTC2990.
> 
> Signed-off-by: Max Staudt <max@enpas.org>

Applied to hwmon-next.

Thanks,
Guenter
