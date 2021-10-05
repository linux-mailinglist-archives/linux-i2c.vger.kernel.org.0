Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1095742212F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 10:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhJEIvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 04:51:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43097 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233441AbhJEIvo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 04:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633423794; x=1664959794;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wnI/BmLBk+uOxjkUxMpKCkqwdoB2WNVKJRNNMMMgnr0=;
  b=KRfw5A5HkD342ki+AfJrkaqnmIacsekpMnE4xsnTwjUG4ZNU+Z6Dm4Gl
   5kSW+uC7R6fnvTQPMOddoLAJ1ZWW2otd2uquWZeVjlHSozaZMcEfJqZvm
   U0R8PINHFdpHkbMbtAu+ctOdfprMvWh06K76NrVY47a9hFT+7oNs9DnTT
   uBzUj0J4TEW+A75B/3CcIJ3SJLD58HPJzqGlpbsyvZG+i8woXf8j2ATFG
   /6eEexPbZ9t1y4k5ItSyV9DhF5oNLl5gfGWQ5dTY5lVv3gqW6ORR5hP5t
   KoifrA18WyevOdr9iZ35ON6uROXCojylRNiMWJeDXFu5kRUPblF+d4z2s
   w==;
IronPort-SDR: MX5/27B/oPDhrwDxRXUCvaz9nDY40iv2zpFqfKJr2C5V8bvz54LAoZAytyHonTIHKWHs6LAAyQ
 v4H+dUJfbox8vnTQ7wOtydsZLsK3bmYANGlnZ2V8w1o3FGyuF2szeA1NBHbuS3sFGunk444t0m
 lp+kR0jq3/ruyjFo1Xk3QUHqK7u3ZPlKPxPOx7KGs15uonLDTXbLw+oUG77ynqMr7eiewsWX8G
 u3GeIGLQS93YhRLvhmtNCbOGbPzfIm0KVukEdreTMkdpw4bG9Srm/oCf1ey8dq7sZ8+9Ih9XPb
 sOMgJZtXXqvidCGaIr0xdX6t
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="138489588"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2021 01:49:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 01:49:53 -0700
Received: from CHE-LT-I41642.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 01:49:50 -0700
Message-ID: <fec61302f82d5030976ae9026619198580b8d53a.camel@microchip.com>
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>
Date:   Tue, 5 Oct 2021 14:19:48 +0530
In-Reply-To: <775e00e3-e204-7138-9648-7551098968b8@gmail.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
         <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
         <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
         <775e00e3-e204-7138-9648-7551098968b8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2021-09-29 at 17:35 +0300, Dmitry Osipenko wrote:
> [Some people who received this message don't often get email from
> digetx@gmail.com. Learn why this is important at 
> http://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> 29.09.2021 10:18, Dmitry Osipenko пишет:
> > +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> > +{
> > +     struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> > +
> > +     pci1xxxx_i2c_shutdown(i2c);
> > +     i2c_del_adapter(&i2c->adap);
> 
> The order is wrong. Adapter must be removed first, then hardware can
> be
> disabled.

ok. Got it. Will change it.
> 
> > +}

