Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2FA359EBD
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 14:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhDIMcf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 08:32:35 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43764 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233576AbhDIMcb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 08:32:31 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CTA2K008524;
        Fri, 9 Apr 2021 12:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=kunsNhIQ2xDmvr6H5OV9rmwY85KybRfRwhrk0dShMvk=;
 b=I7FFxJUWWxArWq+Cd+cdV98Nd4plGkTcBQ+u+rpURr80g1saLXwQryUWpr6oUWxSnHUX
 qcyTXjEv4o+blq0gxLr3BHLXBnMvGBE7VlL44aCcX6C9cF6njvfH/nm4U5AnDFXrfQQB
 nurO0Ra2Ju9q5yOsUIJ1i0GX4L+DeE3qTK6YrojCF4VBIhfY37IIZZE7v5kMO09+W5u0
 uII7+o8P1JGV688Lrqj4tP5OwXK0IZ43kd6zM0IcKSvZddzBxh/A3NV3hfgE9tqHnvDx
 zzedPf5bpuwMYr8NCVye3ftsYzNOE00xoFA1/hZyiPq56TpO1hUo7Vc5SqQM6xe/Wt6P CA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 37rvaw98er-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:32:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CU7B0045543;
        Fri, 9 Apr 2021 12:32:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 37rvbgyvt0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:32:14 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 139CWDok005047;
        Fri, 9 Apr 2021 12:32:13 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 09 Apr 2021 05:32:13 -0700
Date:   Fri, 9 Apr 2021 15:32:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     michael.zaidman@gmail.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <YHBJRvcOSaM/b0RL@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=995 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
X-Proofpoint-ORIG-GUID: Nql2C3aEI3SSi1Zrk1LHLwMhUamjNxIR
X-Proofpoint-GUID: Nql2C3aEI3SSi1Zrk1LHLwMhUamjNxIR
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=908 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090093
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Michael Zaidman,

The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
driver" from Feb 19, 2021, leads to the following static checker
warning:

	drivers/hid/hid-ft260.c:441 ft260_smbus_write()
	error: '__memcpy()' '&rep->data[1]' too small (59 vs 255)

drivers/hid/hid-ft260.c
   423  static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
   424                               u8 *data, u8 data_len, u8 flag)
   425  {
   426          int ret = 0;
   427          int len = 4;
   428  
   429          struct ft260_i2c_write_request_report *rep =
   430                  (struct ft260_i2c_write_request_report *)dev->write_buf;
   431  
   432          rep->address = addr;
   433          rep->data[0] = cmd;
   434          rep->length = data_len + 1;
   435          rep->flag = flag;
   436          len += rep->length;
   437  
   438          rep->report = FT260_I2C_DATA_REPORT_ID(len);
   439  
   440          if (data_len > 0)
   441                  memcpy(&rep->data[1], data, data_len);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch says that this can be called from the i2cdev_ioctl_smbus()
function.

i2cdev_ioctl_smbus()
  --> i2c_smbus_xfer
      --> __i2c_smbus_xfer
          --> ft260_smbus_xfer
              --> ft260_smbus_write

   442  
   443          ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
   444                    rep->report, addr, cmd, rep->length, len);
   445  
   446          ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
   447  
   448          return ret;
   449  }

regards,
dan carpenter
