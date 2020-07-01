Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBCA210E3A
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 17:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731649AbgGAPAP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 11:00:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45286 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbgGAPAO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 11:00:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id g17so10008891plq.12;
        Wed, 01 Jul 2020 08:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RN9Uob7cuR1gH1ZG/1wnY76yopcBcsRZ3UN3Pc2rBNE=;
        b=eW5+aDbCTkpwHvG+yH7bWwtslzPQKw8o4khzZ9Jfloc72VSyCmk6aZyOPULRadI/0x
         cEGcQhooMp+d2nDjzH2qjWr4goaiuqgUEi8cqunOvSKY3z/qZ3JQ81vwk0OAzNnSgqFz
         jtfSsfU4ASdns3E3maqT5GMRHcKEULxE/4+hyV67PQx/JJ5154JmdKSM07yTKhAIgruw
         l3OXCMXMQFGU2CL29zK4hDxZLsTaXZTxdTJzrC+/1EkVdZa2W2MxvXYa2RQUrUa0D94g
         1aw+ko8sg1ybdtpcKcY1YwU+MIKIyD/PdhftsGw0ZNrTSfgRpErzfauVoZm4/D49svGv
         Ngcg==
X-Gm-Message-State: AOAM531/J3Jhu7+ibR9ITuLloZUEhrvRBbUq6sCci7dG9oq08nYs7iyA
        tMzwW4TC3M50FskonXO93cY=
X-Google-Smtp-Source: ABdhPJx6w2QyJcI4wbGNxQyPRuHfBXQ+DGZhqI0gNiEnDPbGveZWRnTA6sbUb1YjwyTIh2MDQe34pQ==
X-Received: by 2002:a17:902:eb49:: with SMTP id i9mr21335692pli.231.1593615613150;
        Wed, 01 Jul 2020 08:00:13 -0700 (PDT)
Received: from sultan-book.localdomain ([89.46.114.241])
        by smtp.gmail.com with ESMTPSA id c2sm5940117pgk.77.2020.07.01.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 08:00:12 -0700 (PDT)
Date:   Wed, 1 Jul 2020 08:00:07 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
Message-ID: <20200701150007.GA2141@sultan-book.localdomain>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
 <20200629174328.GB1646@sultan-box.localdomain>
 <ef949533-c614-7afb-f206-5c54d827deac@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef949533-c614-7afb-f206-5c54d827deac@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 01, 2020 at 11:04:01AM +0300, Jarkko Nikula wrote:
> On 6/29/20 8:43 PM, Sultan Alsawaf wrote:
> > Hmm, for some reason in 5.8 I get the same problem, but 5.7 is fine. Could you
> > try this on 5.7 and see if it works?
> > 
> > In the meantime I'll bisect 5.8 to see why it's causing problems for me...
> > 
> I see the same issue on top of v5.7:

Try reverting my "i2c: designware: Only check the first byte for SMBus block
read length" patch and apply the following change instead:

--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -394,10 +394,12 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			*buf = dw_readl(dev, DW_IC_DATA_CMD);
-			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-				*buf <= I2C_SMBUS_BLOCK_MAX && *buf > 0) {
-				len = i2c_dw_recv_len(dev, *buf);
+			if (flags & I2C_M_RECV_LEN) {
+				/* Ensure length byte is a valid value */
+				if (*buf <= I2C_SMBUS_BLOCK_MAX && *buf > 0)
+					len = i2c_dw_recv_len(dev, *buf);
+				else
+					len = i2c_dw_recv_len(dev, len);
 			}
 			buf++;
 			dev->rx_outstanding--;
